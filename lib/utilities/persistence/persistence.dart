import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PersistenceManager {
  Map<String, dynamic> data = {};

  static PersistenceManager _instance = PersistenceManager._internal();
  PersistenceManager._internal();

  factory PersistenceManager() {
    return _instance;
  }

  static set instance(PersistenceManager instance) {
    _instance = instance;
  }

  Future<bool> saveData(String key, Map<String, dynamic> value) async {
    data[key] = value;
    final jsonData = const JsonEncoder.withIndent('  ').convert(value);
    return await LocalDataManager().write(jsonData);
  }

  Future<void> loadData() async {
    final dataStr = await LocalDataManager().read();
    data = jsonDecode(dataStr);
  }

  Future<Map<String, dynamic>?> getDataBloc(String key) async {
    return data[key];
  }
}

class LocalDataManager {
  static const String _fileName = 'data.json';
  static LocalDataManager _instance = LocalDataManager._internal();
  LocalDataManager._internal();

  static set instance(LocalDataManager instance) {
    _instance = instance;
  }

  factory LocalDataManager() {
    return _instance;
  }

  Future<File> _dataFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }

  Future<bool> write(String data) async {
    try {
      final localFile = await _dataFile();
      localFile.writeAsStringSync(data, flush: true);
    } catch (_) {
      return false;
    }
    return true;
  }

  Future<String> read() async {
    final localFile = await _dataFile();
    return localFile.existsSync() ? localFile.readAsStringSync() : "{}";
  }
}

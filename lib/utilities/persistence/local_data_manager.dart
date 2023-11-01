import 'dart:io';

import 'package:path_provider/path_provider.dart';

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

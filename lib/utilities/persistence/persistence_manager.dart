import 'dart:async';
import 'dart:convert';
import 'package:kaizen/utilities/persistence/local_data_manager.dart';

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

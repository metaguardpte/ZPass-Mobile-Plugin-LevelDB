import 'dart:convert';
import 'dart:typed_data';
import 'package:flkv/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:flkv/flkv.dart';

class LevelDB {
  String _dbPath;
  bool inMemory;

  LevelDB(this._dbPath, {this.inMemory = false});

  Future<bool> put(String? key, String? value) async {
    if (key == null || key.isEmpty) {
      return false;
    }

    if (value == null || value.isEmpty) {
      return false;
    }

    var result = await api.put(db: _dbPath, key: key, value: value);
    return result;
  }

  Future<String?> get(String? key) async {
    if (key == null || key.isEmpty) {
      return null;
    }
    var result = await api.get(db: _dbPath, key: key);
    return result;
  }

  Future<bool> delete(String? key) async {
    if (key == null || key.isEmpty) {
      return false;
    }
    return api.delete(db: _dbPath, key: key);
  }

  Future<List<Record>> list() async {
    var result = await api.getRows(db: _dbPath);
    var records = <Record>[];
    for (var r in result.rows) {
      var record = Record(r.key, r.value);
      records.add(record);
    }
    return records;
  }

  void close() async {
    print("close db $_dbPath");
    await api.close(db: _dbPath);
  }

  Future<void> open() async {
    await api.open(path: _dbPath, inMemory: inMemory);
  }
}

class Record {
  String key;
  String value;
  Record(this.key, this.value);
}
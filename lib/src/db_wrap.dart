import 'dart:convert';
import 'dart:typed_data';
import 'package:flkv/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:flkv/flkv.dart';

class LevelDB {
  String _dbPath;
  late int _dbPtr;
  bool inMemory;

  LevelDB(this._dbPath, {this.inMemory = false});

  Future<bool> put(String? key, String? value) async {
    if (key == null || key.isEmpty) {
      return false;
    }

    if (value == null || value.isEmpty) {
      return false;
    }

    var result = await api.dbPut(ptr: _dbPtr, key: key, value: value);
    return result;
  }

  Future<String?> get(String? key) async {
    if (key == null || key.isEmpty) {
      return null;
    }
    var result = await api.dbGet(ptr: _dbPtr, key: key);
    return result;
  }

  Future<bool> delete(String? key) async {
    if (key == null || key.isEmpty) {
      return false;
    }
    return api.dbDelete(ptr: _dbPtr, key: key);
  }

  Future<List<Record>> list() async {
    var result = await api.dbGetRows(ptr: _dbPtr);
    var records = <Record>[];
    for (var r in result.rows) {
      var record = Record(r.key, r.value);
      records.add(record);
    }
    return records;
  }

  String getPath() {
    return _dbPath;
  }

  Future<bool> close() async {
    print("close db $_dbPath");
    return api.dbClose(ptr: _dbPtr);
  }

  Future<int> open() async {
    _dbPtr = await api.dbNew(path: _dbPath);
    return _dbPtr;
  }

  Future<bool> flush() async {
    print("flush db $_dbPath");
    return api.dbFlush(ptr: _dbPtr);
  }
}

class Record {
  String key;
  String value;
  Record(this.key, this.value);
}

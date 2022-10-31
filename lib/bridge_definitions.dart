// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.49.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names

import 'dart:convert';
import 'dart:async';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

abstract class Flkv {
  Future<int> dbNew({required String path, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDbNewConstMeta;

  Future<String?> dbGet({required int ptr, required String key, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDbGetConstMeta;

  Future<bool> dbPut(
      {required int ptr,
      required String key,
      required String value,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDbPutConstMeta;

  Future<bool> dbClose({required int ptr, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDbCloseConstMeta;

  Future<Rows> dbGetRows({required int ptr, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDbGetRowsConstMeta;

  Future<bool> dbDelete({required int ptr, required String key, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDbDeleteConstMeta;

  Future<bool> dbFlush({required int ptr, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDbFlushConstMeta;
}

class Row {
  final String key;
  final String value;

  Row({
    required this.key,
    required this.value,
  });
}

class Rows {
  final List<Row> rows;

  Rows({
    required this.rows,
  });
}

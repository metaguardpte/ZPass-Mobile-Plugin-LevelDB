// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.49.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names

import 'dart:convert';
import 'dart:async';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

abstract class Flkv {
  Future<String> open(
      {required String path, required bool inMemory, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOpenConstMeta;

  Future<bool> close({required String db, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCloseConstMeta;

  Future<Rows> getRows({required String db, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetRowsConstMeta;

  Future<String> get({required String db, required String key, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetConstMeta;

  Future<bool> put(
      {required String db,
      required String key,
      required String value,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kPutConstMeta;

  Future<bool> delete({required String db, required String key, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDeleteConstMeta;
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
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.49.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:meta/meta.dart';
import 'dart:ffi' as ffi;

class FlkvImpl implements Flkv {
  final FlkvPlatform _platform;
  factory FlkvImpl(ExternalLibrary dylib) => FlkvImpl.raw(FlkvPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory FlkvImpl.wasm(FutureOr<WasmModule> module) =>
      FlkvImpl(module as ExternalLibrary);
  FlkvImpl.raw(this._platform);
  Future<String> open(
          {required String path, required bool inMemory, dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner
            .wire_open(port_, _platform.api2wire_String(path), inMemory),
        parseSuccessData: _wire2api_String,
        constMeta: kOpenConstMeta,
        argValues: [path, inMemory],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kOpenConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "open",
        argNames: ["path", "inMemory"],
      );

  Future<bool> close({required String db, dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) =>
            _platform.inner.wire_close(port_, _platform.api2wire_String(db)),
        parseSuccessData: _wire2api_bool,
        constMeta: kCloseConstMeta,
        argValues: [db],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kCloseConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "close",
        argNames: ["db"],
      );

  Future<Rows> getRows({required String db, dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) =>
            _platform.inner.wire_get_rows(port_, _platform.api2wire_String(db)),
        parseSuccessData: _wire2api_rows,
        constMeta: kGetRowsConstMeta,
        argValues: [db],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kGetRowsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_rows",
        argNames: ["db"],
      );

  Future<String> get({required String db, required String key, dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner.wire_get(port_,
            _platform.api2wire_String(db), _platform.api2wire_String(key)),
        parseSuccessData: _wire2api_String,
        constMeta: kGetConstMeta,
        argValues: [db, key],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kGetConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get",
        argNames: ["db", "key"],
      );

  Future<bool> put(
          {required String db,
          required String key,
          required String value,
          dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner.wire_put(
            port_,
            _platform.api2wire_String(db),
            _platform.api2wire_String(key),
            _platform.api2wire_String(value)),
        parseSuccessData: _wire2api_bool,
        constMeta: kPutConstMeta,
        argValues: [db, key, value],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kPutConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "put",
        argNames: ["db", "key", "value"],
      );

  Future<bool> delete(
          {required String db, required String key, dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner.wire_delete(port_,
            _platform.api2wire_String(db), _platform.api2wire_String(key)),
        parseSuccessData: _wire2api_bool,
        constMeta: kDeleteConstMeta,
        argValues: [db, key],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kDeleteConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "delete",
        argNames: ["db", "key"],
      );

// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  bool _wire2api_bool(dynamic raw) {
    return raw as bool;
  }

  List<Row> _wire2api_list_row(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_row).toList();
  }

  Row _wire2api_row(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Row(
      key: _wire2api_String(arr[0]),
      value: _wire2api_String(arr[1]),
    );
  }

  Rows _wire2api_rows(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return Rows(
      rows: _wire2api_list_row(arr[0]),
    );
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }
}

// Section: api2wire

@protected
bool api2wire_bool(bool raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

class FlkvPlatform extends FlutterRustBridgeBase<FlkvWire> {
  FlkvPlatform(ffi.DynamicLibrary dylib) : super(FlkvWire(dylib));
// Section: api2wire

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_String(String raw) {
    return api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }
// Section: api_fill_to_wire

}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class FlkvWire implements FlutterRustBridgeWireBase {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  FlkvWire(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  FlkvWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();

  void wire_open(
    int port_,
    ffi.Pointer<wire_uint_8_list> path,
    bool in_memory,
  ) {
    return _wire_open(
      port_,
      path,
      in_memory,
    );
  }

  late final _wire_openPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>,
              ffi.Bool)>>('wire_open');
  late final _wire_open = _wire_openPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>, bool)>();

  void wire_close(
    int port_,
    ffi.Pointer<wire_uint_8_list> db,
  ) {
    return _wire_close(
      port_,
      db,
    );
  }

  late final _wire_closePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>('wire_close');
  late final _wire_close = _wire_closePtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_get_rows(
    int port_,
    ffi.Pointer<wire_uint_8_list> db,
  ) {
    return _wire_get_rows(
      port_,
      db,
    );
  }

  late final _wire_get_rowsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>('wire_get_rows');
  late final _wire_get_rows = _wire_get_rowsPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_get(
    int port_,
    ffi.Pointer<wire_uint_8_list> db,
    ffi.Pointer<wire_uint_8_list> key,
  ) {
    return _wire_get(
      port_,
      db,
      key,
    );
  }

  late final _wire_getPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>>('wire_get');
  late final _wire_get = _wire_getPtr.asFunction<
      void Function(
          int, ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_put(
    int port_,
    ffi.Pointer<wire_uint_8_list> db,
    ffi.Pointer<wire_uint_8_list> key,
    ffi.Pointer<wire_uint_8_list> value,
  ) {
    return _wire_put(
      port_,
      db,
      key,
      value,
    );
  }

  late final _wire_putPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>>('wire_put');
  late final _wire_put = _wire_putPtr.asFunction<
      void Function(int, ffi.Pointer<wire_uint_8_list>,
          ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_delete(
    int port_,
    ffi.Pointer<wire_uint_8_list> db,
    ffi.Pointer<wire_uint_8_list> key,
  ) {
    return _wire_delete(
      port_,
      db,
      key,
    );
  }

  late final _wire_deletePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>>('wire_delete');
  late final _wire_delete = _wire_deletePtr.asFunction<
      void Function(
          int, ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_0(
    int len,
  ) {
    return _new_uint_8_list_0(
      len,
    );
  }

  late final _new_uint_8_list_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list_0');
  late final _new_uint_8_list_0 = _new_uint_8_list_0Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturnStruct(
    WireSyncReturnStruct val,
  ) {
    return _free_WireSyncReturnStruct(
      val,
    );
  }

  late final _free_WireSyncReturnStructPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturnStruct)>>(
          'free_WireSyncReturnStruct');
  late final _free_WireSyncReturnStruct = _free_WireSyncReturnStructPtr
      .asFunction<void Function(WireSyncReturnStruct)>();
}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Bool Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;

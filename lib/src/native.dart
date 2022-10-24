// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

class NativeFlKvDB {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  NativeFlKvDB(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  NativeFlKvDB.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<FlKv> db_open(
    ffi.Pointer<ffi.Char> name,
    bool memory,
  ) {
    return _db_open(
      name,
      memory,
    );
  }

  late final _db_openPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<FlKv> Function(
              ffi.Pointer<ffi.Char>, ffi.Bool)>>('db_open');
  late final _db_open = _db_openPtr
      .asFunction<ffi.Pointer<FlKv> Function(ffi.Pointer<ffi.Char>, bool)>();

  bool db_put(
    ffi.Pointer<FlKv> flkv,
    ffi.Pointer<KvBuffer> key,
    ffi.Pointer<KvBuffer> value,
  ) {
    return _db_put(
      flkv,
      key,
      value,
    );
  }

  late final _db_putPtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(ffi.Pointer<FlKv>, ffi.Pointer<KvBuffer>,
              ffi.Pointer<KvBuffer>)>>('db_put');
  late final _db_put = _db_putPtr.asFunction<
      bool Function(
          ffi.Pointer<FlKv>, ffi.Pointer<KvBuffer>, ffi.Pointer<KvBuffer>)>();

  ffi.Pointer<FlKvBatch> db_create_batch() {
    return _db_create_batch();
  }

  late final _db_create_batchPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<FlKvBatch> Function()>>(
          'db_create_batch');
  late final _db_create_batch =
      _db_create_batchPtr.asFunction<ffi.Pointer<FlKvBatch> Function()>();

  bool batch_add_kv(
    ffi.Pointer<FlKvBatch> batch,
    ffi.Pointer<KvBuffer> key,
    ffi.Pointer<KvBuffer> value,
  ) {
    return _batch_add_kv(
      batch,
      key,
      value,
    );
  }

  late final _batch_add_kvPtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(ffi.Pointer<FlKvBatch>, ffi.Pointer<KvBuffer>,
              ffi.Pointer<KvBuffer>)>>('batch_add_kv');
  late final _batch_add_kv = _batch_add_kvPtr.asFunction<
      bool Function(ffi.Pointer<FlKvBatch>, ffi.Pointer<KvBuffer>,
          ffi.Pointer<KvBuffer>)>();

  bool batch_clear(
    ffi.Pointer<FlKvBatch> batch,
  ) {
    return _batch_clear(
      batch,
    );
  }

  late final _batch_clearPtr =
      _lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<FlKvBatch>)>>(
          'batch_clear');
  late final _batch_clear =
      _batch_clearPtr.asFunction<bool Function(ffi.Pointer<FlKvBatch>)>();

  bool db_put_batch(
    ffi.Pointer<FlKv> flkv,
    ffi.Pointer<FlKvBatch> batch,
    bool sync1,
  ) {
    return _db_put_batch(
      flkv,
      batch,
      sync1,
    );
  }

  late final _db_put_batchPtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(ffi.Pointer<FlKv>, ffi.Pointer<FlKvBatch>,
              ffi.Bool)>>('db_put_batch');
  late final _db_put_batch = _db_put_batchPtr.asFunction<
      bool Function(ffi.Pointer<FlKv>, ffi.Pointer<FlKvBatch>, bool)>();

  ffi.Pointer<KvBuffer> db_get(
    ffi.Pointer<FlKv> flkv,
    ffi.Pointer<KvBuffer> key,
  ) {
    return _db_get(
      flkv,
      key,
    );
  }

  late final _db_getPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<KvBuffer> Function(
              ffi.Pointer<FlKv>, ffi.Pointer<KvBuffer>)>>('db_get');
  late final _db_get = _db_getPtr.asFunction<
      ffi.Pointer<KvBuffer> Function(
          ffi.Pointer<FlKv>, ffi.Pointer<KvBuffer>)>();

  bool db_delete(
    ffi.Pointer<FlKv> flkv,
    ffi.Pointer<KvBuffer> key,
  ) {
    return _db_delete(
      flkv,
      key,
    );
  }

  late final _db_deletePtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(
              ffi.Pointer<FlKv>, ffi.Pointer<KvBuffer>)>>('db_delete');
  late final _db_delete = _db_deletePtr
      .asFunction<bool Function(ffi.Pointer<FlKv>, ffi.Pointer<KvBuffer>)>();

  int db_list(
    ffi.Pointer<FlKv> flkv,
    ffi.Pointer<ffi.Pointer<Row>> buffer,
    ffi.Pointer<uintptr_t> size,
  ) {
    return _db_list(
      flkv,
      buffer,
      size,
    );
  }

  late final _db_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(ffi.Pointer<FlKv>, ffi.Pointer<ffi.Pointer<Row>>,
              ffi.Pointer<uintptr_t>)>>('db_list');
  late final _db_list = _db_listPtr.asFunction<
      int Function(ffi.Pointer<FlKv>, ffi.Pointer<ffi.Pointer<Row>>,
          ffi.Pointer<uintptr_t>)>();

  void release_list(
    ffi.Pointer<Row> buffer,
    int size,
  ) {
    return _release_list(
      buffer,
      size,
    );
  }

  late final _release_listPtr = _lookup<
          ffi.NativeFunction<ffi.Void Function(ffi.Pointer<Row>, uintptr_t)>>(
      'release_list');
  late final _release_list =
      _release_listPtr.asFunction<void Function(ffi.Pointer<Row>, int)>();

  bool db_flush(
    ffi.Pointer<FlKv> flkv,
  ) {
    return _db_flush(
      flkv,
    );
  }

  late final _db_flushPtr =
      _lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<FlKv>)>>(
          'db_flush');
  late final _db_flush =
      _db_flushPtr.asFunction<bool Function(ffi.Pointer<FlKv>)>();

  bool db_close(
    ffi.Pointer<FlKv> flkv,
  ) {
    return _db_close(
      flkv,
    );
  }

  late final _db_closePtr =
      _lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<FlKv>)>>(
          'db_close');
  late final _db_close =
      _db_closePtr.asFunction<bool Function(ffi.Pointer<FlKv>)>();
}

class FlKv extends ffi.Opaque {}

class FlKvBatch extends ffi.Opaque {}

/// Array struct
class KvBuffer extends ffi.Struct {
  external ffi.Pointer<ffi.UnsignedChar> data;

  @uintptr_t()
  external int length;
}

typedef uintptr_t = ffi.UnsignedLong;

class Row extends ffi.Struct {
  external KvBuffer key;

  external KvBuffer value;
}

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
    ffi.Pointer<ffi.Int8> name,
    bool memory,
  ) {
    return _db_open(
      name,
      memory ? 1 : 0,
    );
  }

  late final _db_open_ptr = _lookup<ffi.NativeFunction<_c_db_open>>('db_open');
  late final _dart_db_open _db_open = _db_open_ptr.asFunction<_dart_db_open>();

  bool db_put(
    ffi.Pointer<FlKv> flkv,
    ffi.Pointer<KvBuffer> key,
    ffi.Pointer<KvBuffer> value,
  ) {
    return _db_put(
          flkv,
          key,
          value,
        ) !=
        0;
  }

  late final _db_put_ptr = _lookup<ffi.NativeFunction<_c_db_put>>('db_put');
  late final _dart_db_put _db_put = _db_put_ptr.asFunction<_dart_db_put>();

  ffi.Pointer<FlKvBatch> db_create_batch() {
    return _db_create_batch();
  }

  late final _db_create_batch_ptr =
      _lookup<ffi.NativeFunction<_c_db_create_batch>>('db_create_batch');
  late final _dart_db_create_batch _db_create_batch =
      _db_create_batch_ptr.asFunction<_dart_db_create_batch>();

  bool batch_add_kv(
    ffi.Pointer<FlKvBatch> batch,
    ffi.Pointer<KvBuffer> key,
    ffi.Pointer<KvBuffer> value,
  ) {
    return _batch_add_kv(
          batch,
          key,
          value,
        ) !=
        0;
  }

  late final _batch_add_kv_ptr =
      _lookup<ffi.NativeFunction<_c_batch_add_kv>>('batch_add_kv');
  late final _dart_batch_add_kv _batch_add_kv =
      _batch_add_kv_ptr.asFunction<_dart_batch_add_kv>();

  bool batch_clear(
    ffi.Pointer<FlKvBatch> batch,
  ) {
    return _batch_clear(
          batch,
        ) !=
        0;
  }

  late final _batch_clear_ptr =
      _lookup<ffi.NativeFunction<_c_batch_clear>>('batch_clear');
  late final _dart_batch_clear _batch_clear =
      _batch_clear_ptr.asFunction<_dart_batch_clear>();

  bool db_put_batch(
    ffi.Pointer<FlKv> flkv,
    ffi.Pointer<FlKvBatch> batch,
    bool sync_1,
  ) {
    return _db_put_batch(
          flkv,
          batch,
          sync_1 ? 1 : 0,
        ) !=
        0;
  }

  late final _db_put_batch_ptr =
      _lookup<ffi.NativeFunction<_c_db_put_batch>>('db_put_batch');
  late final _dart_db_put_batch _db_put_batch =
      _db_put_batch_ptr.asFunction<_dart_db_put_batch>();

  ffi.Pointer<KvBuffer> db_get(
    ffi.Pointer<FlKv> flkv,
    ffi.Pointer<KvBuffer> key,
  ) {
    return _db_get(
      flkv,
      key,
    );
  }

  late final _db_get_ptr = _lookup<ffi.NativeFunction<_c_db_get>>('db_get');
  late final _dart_db_get _db_get = _db_get_ptr.asFunction<_dart_db_get>();

  bool db_delete(
    ffi.Pointer<FlKv> flkv,
    ffi.Pointer<KvBuffer> key,
  ) {
    return _db_delete(
          flkv,
          key,
        ) !=
        0;
  }

  late final _db_delete_ptr =
      _lookup<ffi.NativeFunction<_c_db_delete>>('db_delete');
  late final _dart_db_delete _db_delete =
      _db_delete_ptr.asFunction<_dart_db_delete>();

  bool db_flush(
    ffi.Pointer<FlKv> flkv,
  ) {
    return _db_flush(
          flkv,
        ) !=
        0;
  }

  late final _db_flush_ptr =
      _lookup<ffi.NativeFunction<_c_db_flush>>('db_flush');
  late final _dart_db_flush _db_flush =
      _db_flush_ptr.asFunction<_dart_db_flush>();

  void db_close(
    ffi.Pointer<FlKv> flkv,
  ) {
    return _db_close(
      flkv,
    );
  }

  late final _db_close_ptr =
      _lookup<ffi.NativeFunction<_c_db_close>>('db_close');
  late final _dart_db_close _db_close =
      _db_close_ptr.asFunction<_dart_db_close>();
}

class FlKv extends ffi.Opaque {}

class FlKvBatch extends ffi.Opaque {}

/// Array struct
class KvBuffer extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> data;

  @ffi.Uint64()
  external int length;
}

typedef _c_db_open = ffi.Pointer<FlKv> Function(
  ffi.Pointer<ffi.Int8> name,
  ffi.Uint8 memory,
);

typedef _dart_db_open = ffi.Pointer<FlKv> Function(
  ffi.Pointer<ffi.Int8> name,
  int memory,
);

typedef _c_db_put = ffi.Uint8 Function(
  ffi.Pointer<FlKv> flkv,
  ffi.Pointer<KvBuffer> key,
  ffi.Pointer<KvBuffer> value,
);

typedef _dart_db_put = int Function(
  ffi.Pointer<FlKv> flkv,
  ffi.Pointer<KvBuffer> key,
  ffi.Pointer<KvBuffer> value,
);

typedef _c_db_create_batch = ffi.Pointer<FlKvBatch> Function();

typedef _dart_db_create_batch = ffi.Pointer<FlKvBatch> Function();

typedef _c_batch_add_kv = ffi.Uint8 Function(
  ffi.Pointer<FlKvBatch> batch,
  ffi.Pointer<KvBuffer> key,
  ffi.Pointer<KvBuffer> value,
);

typedef _dart_batch_add_kv = int Function(
  ffi.Pointer<FlKvBatch> batch,
  ffi.Pointer<KvBuffer> key,
  ffi.Pointer<KvBuffer> value,
);

typedef _c_batch_clear = ffi.Uint8 Function(
  ffi.Pointer<FlKvBatch> batch,
);

typedef _dart_batch_clear = int Function(
  ffi.Pointer<FlKvBatch> batch,
);

typedef _c_db_put_batch = ffi.Uint8 Function(
  ffi.Pointer<FlKv> flkv,
  ffi.Pointer<FlKvBatch> batch,
  ffi.Uint8 sync_1,
);

typedef _dart_db_put_batch = int Function(
  ffi.Pointer<FlKv> flkv,
  ffi.Pointer<FlKvBatch> batch,
  int sync_1,
);

typedef _c_db_get = ffi.Pointer<KvBuffer> Function(
  ffi.Pointer<FlKv> flkv,
  ffi.Pointer<KvBuffer> key,
);

typedef _dart_db_get = ffi.Pointer<KvBuffer> Function(
  ffi.Pointer<FlKv> flkv,
  ffi.Pointer<KvBuffer> key,
);

typedef _c_db_delete = ffi.Uint8 Function(
  ffi.Pointer<FlKv> flkv,
  ffi.Pointer<KvBuffer> key,
);

typedef _dart_db_delete = int Function(
  ffi.Pointer<FlKv> flkv,
  ffi.Pointer<KvBuffer> key,
);

typedef _c_db_flush = ffi.Uint8 Function(
  ffi.Pointer<FlKv> flkv,
);

typedef _dart_db_flush = int Function(
  ffi.Pointer<FlKv> flkv,
);

typedef _c_db_close = ffi.Void Function(
  ffi.Pointer<FlKv> flkv,
);

typedef _dart_db_close = void Function(
  ffi.Pointer<FlKv> flkv,
);

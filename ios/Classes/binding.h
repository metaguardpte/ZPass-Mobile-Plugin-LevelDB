#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct WireSyncReturnStruct {
  uint8_t *ptr;
  int32_t len;
  bool success;
} WireSyncReturnStruct;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

void wire_open(int64_t port_, struct wire_uint_8_list *path, bool in_memory);

void wire_close(int64_t port_, struct wire_uint_8_list *db);

void wire_get_rows(int64_t port_, struct wire_uint_8_list *db);

void wire_get(int64_t port_, struct wire_uint_8_list *db, struct wire_uint_8_list *key);

void wire_put(int64_t port_,
              struct wire_uint_8_list *db,
              struct wire_uint_8_list *key,
              struct wire_uint_8_list *value);

void wire_delete(int64_t port_, struct wire_uint_8_list *db, struct wire_uint_8_list *key);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void free_WireSyncReturnStruct(struct WireSyncReturnStruct val);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_open);
    dummy_var ^= ((int64_t) (void*) wire_close);
    dummy_var ^= ((int64_t) (void*) wire_get_rows);
    dummy_var ^= ((int64_t) (void*) wire_get);
    dummy_var ^= ((int64_t) (void*) wire_put);
    dummy_var ^= ((int64_t) (void*) wire_delete);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturnStruct);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}
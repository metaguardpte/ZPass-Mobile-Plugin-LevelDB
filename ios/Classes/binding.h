#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

void wire_db_new(int64_t port_, struct wire_uint_8_list *path);

void wire_db_get(int64_t port_, uint64_t ptr, struct wire_uint_8_list *key);

void wire_db_put(int64_t port_,
                 uint64_t ptr,
                 struct wire_uint_8_list *key,
                 struct wire_uint_8_list *value);

void wire_db_close(int64_t port_, uint64_t ptr);

void wire_db_get_rows(int64_t port_, uint64_t ptr);

void wire_db_delete(int64_t port_, uint64_t ptr, struct wire_uint_8_list *key);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void free_WireSyncReturnStruct(WireSyncReturnStruct val);

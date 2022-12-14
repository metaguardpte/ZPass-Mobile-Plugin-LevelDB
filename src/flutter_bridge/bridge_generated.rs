#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.49.0.

use crate::flutter_bridge::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::*;

// Section: imports

// Section: wire functions

fn wire_db_new_impl(port_: MessagePort, path: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "db_new",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_path = path.wire2api();
            move |task_callback| Ok(db_new(api_path))
        },
    )
}
fn wire_db_get_impl(
    port_: MessagePort,
    ptr: impl Wire2Api<u64> + UnwindSafe,
    key: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "db_get",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_ptr = ptr.wire2api();
            let api_key = key.wire2api();
            move |task_callback| Ok(db_get(api_ptr, api_key))
        },
    )
}
fn wire_db_put_impl(
    port_: MessagePort,
    ptr: impl Wire2Api<u64> + UnwindSafe,
    key: impl Wire2Api<String> + UnwindSafe,
    value: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "db_put",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_ptr = ptr.wire2api();
            let api_key = key.wire2api();
            let api_value = value.wire2api();
            move |task_callback| Ok(db_put(api_ptr, api_key, api_value))
        },
    )
}
fn wire_db_close_impl(port_: MessagePort, ptr: impl Wire2Api<u64> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "db_close",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_ptr = ptr.wire2api();
            move |task_callback| Ok(db_close(api_ptr))
        },
    )
}
fn wire_db_get_rows_impl(port_: MessagePort, ptr: impl Wire2Api<u64> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "db_get_rows",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_ptr = ptr.wire2api();
            move |task_callback| Ok(db_get_rows(api_ptr))
        },
    )
}
fn wire_db_delete_impl(
    port_: MessagePort,
    ptr: impl Wire2Api<u64> + UnwindSafe,
    key: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "db_delete",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_ptr = ptr.wire2api();
            let api_key = key.wire2api();
            move |task_callback| Ok(db_delete(api_ptr, api_key))
        },
    )
}
fn wire_db_flush_impl(port_: MessagePort, ptr: impl Wire2Api<u64> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "db_flush",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_ptr = ptr.wire2api();
            move |task_callback| Ok(db_flush(api_ptr))
        },
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<u64> for u64 {
    fn wire2api(self) -> u64 {
        self
    }
}
impl Wire2Api<u8> for u8 {
    fn wire2api(self) -> u8 {
        self
    }
}

// Section: impl IntoDart

impl support::IntoDart for Row {
    fn into_dart(self) -> support::DartAbi {
        vec![self.key.into_dart(), self.value.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for Row {}

impl support::IntoDart for Rows {
    fn into_dart(self) -> support::DartAbi {
        vec![self.rows.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for Rows {}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

#[cfg(not(target_family = "wasm"))]
#[path = "bridge_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;

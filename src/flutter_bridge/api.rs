extern crate rusty_leveldb;

use rusty_leveldb::{LdbIterator, Options, Status, DB};
use std::sync::{Arc, Mutex};

pub struct MyDB {
    db: DB,
}

pub fn db_new(path: String) -> u64 {
    initialize();
    Box::into_raw(Box::new(MyDB {
        db: DB::open(&path, Options::default()).unwrap(),
    })) as u64
}

pub fn db_get(ptr: u64, key: String) -> Option<String> {
    unsafe {
        let my_db = ptr as *mut MyDB;
        if my_db.is_null() {
            return None;
        }
        match (*my_db).db.get(key.as_bytes()) {
            Some(v) => String::from_utf8(v).ok(),
            None => {
                return None;
            }
        }
    }
}

pub fn db_put(ptr: u64, key: String, value: String) -> bool {
    unsafe {
        let my_db = ptr as *mut MyDB;
        if my_db.is_null() {
            return false;
        }
        match (*my_db).db.put(key.as_bytes(), value.as_bytes()) {
            Ok(_) => true,
            Err(err) => {
                println!("Db put err {}", err);
                false
            }
        }
    }
}

pub fn db_close(ptr: u64) -> bool {
    unsafe {
        let my_db = ptr as *mut MyDB;
        if my_db.is_null() {
            return false;
        }
        match (*my_db).db.close() {
            Ok(_) => {
                let _ = Box::from_raw(my_db);
                true
            }
            Err(err) => {
                println!("Db close err {}", err);
                false
            }
        }
    }
}

pub fn db_get_rows(ptr: u64) -> Rows {
    unsafe {
        let mut rows = vec![];
        let my_db = ptr as *mut MyDB;
        if my_db.is_null() {
            return Rows { rows };
        }

        let mut it = (*my_db).db.new_iter().unwrap();
        let (mut k, mut v) = (vec![], vec![]);
        while it.advance() {
            it.current(&mut k, &mut v);
            let key = String::from_utf8(k.clone()).unwrap();
            let value = String::from_utf8(v.clone()).unwrap();
            let row = Row { key, value };
            rows.push(row);
        }

        Rows { rows }
    }
}

pub fn db_delete(ptr: u64, key: String) -> bool {
    unsafe {
        let my_db = ptr as *mut MyDB;
        if my_db.is_null() {
            return false;
        }
        match (*my_db).db.delete(key.as_bytes()) {
            Ok(_) => true,
            Err(err) => {
                error!("Delete key {} failed: {}", key, err);
                false
            }
        }
    }
}

fn initialize() {
    #[cfg(target_os = "android")]
    {
        let level = if cfg!(debug_assertions) {
            log::Level::Debug
        } else {
            log::Level::Info
        };
        android_logger::init_once(
            android_logger::Config::default()
                .with_min_level(level) // limit log level
                .with_tag("ffi"), // logs will show under mytag tag
        );
    }

    // #[cfg(target_os = "ios")]
    // {
    //     use oslog::OsLogger;
    //     use std::sync::Once;
    //
    //     static START: Once = Once::new();
    //
    //     START.call_once(|| {
    //         let level = if cfg!(debug_assertions) {
    //             LevelFilter::Debug
    //         } else {
    //             LevelFilter::Info
    //         };
    //         let _ = OsLogger::new("com.example.flutterApp")
    //             .level_filter(level)
    //             .init();
    //         info!("Init log succ");
    //     });
    // }
}

pub struct Row {
    pub key: String,
    pub value: String,
}
pub struct Rows {
    pub rows: Vec<Row>,
}

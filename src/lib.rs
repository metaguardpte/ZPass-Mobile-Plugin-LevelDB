extern crate rusty_leveldb;

use rusty_leveldb::{LdbIterator, Options, DB};

use crate::flutter_bridge::{Row, Rows};
use once_cell::sync::Lazy;
use std::result::Result::Ok;
use std::{collections::HashMap, sync::RwLock};

#[macro_use]
extern crate log;

pub struct MyDB {
    db: DB,
}

unsafe impl Sync for MyDB {}

pub static cache: Lazy<RwLock<HashMap<String, MyDB>>> = Lazy::new(|| {
    let mut m: HashMap<String, MyDB> = HashMap::new();
    RwLock::new(m)
});
mod flutter_bridge;

// static mut cache: HashMap<String, DB> = HashMap::from([]);

pub fn open(path: &str) -> DB {
    let mut opt = Options::default();
    opt.reuse_logs = false;
    opt.reuse_manifest = false;
    opt.compression_type = rusty_leveldb::CompressionType::CompressionSnappy;
    return DB::open(path, opt).unwrap();
}

pub fn open_memory(key: String) -> DB {
    return DB::open(key, rusty_leveldb::in_memory()).unwrap();
}

pub fn new(path: &str, in_memory: bool) -> String {
    // unsafe {
    if in_memory {
        let key = "in_memory".to_string();
        let mut db_locker = cache.write().unwrap();
        if db_locker.contains_key(path.clone()) {
            return path.to_string();
        }
        let mut db = open_memory(key.to_string());

        db_locker.insert(key.clone(), MyDB { db });
        return key.to_string();
    }

    let mut db_locker = cache.write().unwrap();
    if db_locker.contains_key(path.clone()) {
        return path.to_string();
    }

    let db = open(path);
    db_locker.insert(path.to_string(), MyDB { db });
    return path.to_string();
}

pub fn close(key: String) -> bool {
    // let mut db = get_mut_db_instance(key);
    let mut locker_res = cache.write();
    if let Ok(mut locker) = locker_res {
        let db_option = locker.get_mut(&key);
        let db = db_option;
        if db.is_some() {
            let db = db.unwrap();
            match db.db.close() {
                Ok(_) => return true,
                Err(e) => {
                    error!("err: {}", e.to_string());
                    return false;
                }
            }
        }
    }
    return false;
}

pub fn get(db: String, key: String) -> String {
    let mut locker_res = cache.write();
    if let Ok(mut locker) = locker_res {
        let db_option = locker.get_mut(&db);
        let db = db_option;
        if db.is_some() {
            let db = db.unwrap();
            let mut value = db.db.get(key.as_bytes());
            if value.is_some() {
                return String::from_utf8(value.unwrap()).unwrap();
            }
        }
    }
    return "".to_string();
}

pub fn put(db: String, key: String, value: String) -> bool {
    let mut locker_res = cache.write();
    if let Ok(mut locker) = locker_res {
        let db_option = locker.get_mut(&db);
        let db = db_option;
        if db.is_some() {
            let db = db.unwrap();
            db.db.put(key.as_bytes(), value.as_bytes());
            return true;
        }
    }
    return false;
}

pub fn delete(db: String, key: String) -> bool {
    let mut locker_res = cache.write();
    if let Ok(mut locker) = locker_res {
        let db_option = locker.get_mut(&db);
        let db = db_option;
        if db.is_some() {
            let db = db.unwrap();
            db.db.delete(key.as_bytes());
            return true;
        }
    }
    return false;
}

pub fn get_rows(db: String) -> Rows {
    let mut rows = vec![];
    let mut locker_res = cache.write();
    if let Ok(mut locker) = locker_res {
        let db_option = locker.get_mut(&db);
        let db = db_option;
        if db.is_some() {
            let db = db.unwrap();
            let mut it = db.db.new_iter().unwrap();
            let (mut k, mut v) = (vec![], vec![]);
            while it.advance() {
                it.current(&mut k, &mut v);
                let key = String::from_utf8(k.clone()).unwrap();
                let value = String::from_utf8(v.clone()).unwrap();
                let row = Row { key, value };
                rows.push(row);
            }
        }
    }
    Rows { rows }
}

extern crate rusty_leveldb;

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

pub fn open(path: String, in_memory: bool) -> String {
    initialize();
    return crate::new(&path, in_memory);
}

pub fn close(db: String) -> bool {
    return crate::close(db);
}

pub struct Row {
    pub key: String,
    pub value: String,
}
pub struct Rows {
    pub rows: Vec<Row>,
}

pub fn get_rows(db: String) -> Rows {
    crate::get_rows(db)
}

pub fn get(db: String, key: String) -> String {
    return crate::get(db, key);
}

pub fn put(db: String, key: String, value: String) -> bool {
    return crate::put(db, key, value);
}

pub fn delete(db: String, key: String) -> bool {
    return crate::delete(db, key);
}

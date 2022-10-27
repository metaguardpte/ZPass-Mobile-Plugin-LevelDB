extern crate rusty_leveldb;

use rusty_leveldb::{LdbIterator, Options, DB};

use crate::flutter_bridge::{Row, Rows};
use once_cell::sync::Lazy;
use std::result::Result::Ok;
use std::sync::{Arc, Mutex};
use std::{collections::HashMap, sync::RwLock};

#[macro_use]
extern crate log;

mod flutter_bridge;

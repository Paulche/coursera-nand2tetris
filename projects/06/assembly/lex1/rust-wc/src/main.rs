
mod context;

use context::Context;

use std::env;
use std::fs::{metadata};

fn usage() {
    println!("Usage: wc $filename");
}

fn with_path(path: String) {
    let meta = metadata(&path).ok();

    if meta.is_none() {
        println!("ERROR: Failed to open file {}!", path);
        return;
    }

    let mut context = Context::new();
        
    context.parse(&path);

    context.report();
}

fn main() {
    match env::args().nth(1) {
        None            => usage(),
        Some(path)      => with_path(path),
    }
}

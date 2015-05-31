
mod context;

use context::Context;

use std::env;

fn main() {
  if env::args().count() < 2 {
    println!("Usage: wc $filename")
  } else {
    let pathname = env::args().nth(1).unwrap();

    let mut context = Context::new();
    
    context.parse(&pathname);

    context.report();
  }
}

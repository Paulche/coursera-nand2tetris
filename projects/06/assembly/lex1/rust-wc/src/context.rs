
extern crate libc;

#[link(name="wc")]
#[link(name="l")]
extern {
  fn wc_parse(path: *const u8, context: *mut Context);
}

#[repr(C)]
#[derive(Debug)]
pub struct Context {
    pub chars: u32,
    pub words: u32,
    pub lines: u32
}

impl Context {
    pub fn new() -> Context {
        Context { chars: 0, words: 0, lines: 0 }
    }

    pub fn parse(&mut self, path: &str) {
        unsafe {
            wc_parse(path.as_ptr(),self);
        }
    }

    pub fn report(&self) {
        println!("Chars: {}", self.chars);
        println!("Words: {}", self.words);
        println!("Lines: {}", self.lines);
    }
}





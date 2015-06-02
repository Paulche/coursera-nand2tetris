
extern crate libc;

#[link(name="wc")]
#[link(name="l")]
extern {
  fn yyparse();
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
            yyparse();
        }
    }

    pub fn report(&self) {
        println!("Chars: {}", self.chars);
        println!("Words: {}", self.words);
        println!("Lines: {}", self.lines);
    }
}





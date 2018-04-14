fn main() {
    println!("Hello, world!");
}

// this function can be accessed from Javascript (no_mangle)
#[no_mangle]
pub extern "C" fn add_one(x: i32) -> i32 {
    x + 1
}
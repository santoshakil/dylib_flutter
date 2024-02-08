use std::os::raw::c_uint;

#[no_mangle]
pub extern "C" fn add(left: c_uint, right: c_uint) -> c_uint {
    let current_dir = std::env::current_dir().unwrap();
    let current_dir = std::fs::canonicalize(current_dir).unwrap();
    println!("Current dir:: {:?}", current_dir);
    (left + right + 100) as c_uint
}

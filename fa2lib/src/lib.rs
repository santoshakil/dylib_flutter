use std::os::raw::c_uint;

#[no_mangle]
pub extern "C" fn add(left: c_uint, right: c_uint) -> c_uint {
    (left + right) as c_uint
}
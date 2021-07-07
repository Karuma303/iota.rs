#[no_mangle]
pub extern "C" fn test_function() {
    println!("Test function in Rust lib called !!!");
}

fn hello() -> bool {
    true
}

#[cfg(test)]
mod tests {
    use crate::{hello, test_function};

    #[test]
    fn function_1() {
        test_function();
    }

    #[test]
    fn hello_works() {
        assert_eq!(hello(), true);
    }

    // TODO:
    // can create client
    // can get nodeinfo
    // can get health
}

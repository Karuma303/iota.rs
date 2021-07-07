# IOTA Client Library - Dart/Flutter binding

Dart binding to the iota.rs client library.

``` 
Please note that this is work in progress and not released yet !
```

# Goal

The goal of this project is to provide Dart bindings for the official
(Rust-based) IOTA client library. Furthermore, there is the goal to turn these
Dart bindings into a Flutter Plugin that can be used to enable IOTA client
functionality in any Flutter Application. This should be achieved by providing a
native implementation as well as a web implementation that is based on WASM.

Next Steps:

- [ ] Check [Dustr](https://github.com/mqnfred/dustr)
- [ ] Check [FFIShim](https://github.com/mqnfred/ffishim)
- [ ] Check [ffi_helpers](https://docs.rs/ffi_helpers/0.2.0/ffi_helpers/)
- [ ] Check [Pyo3](https://crates.io/crates/pyo3), to see how it works with the python client
- [ ] Check, if we should use [FlapiGen](https://dushistov.github.io/flapigen-rs/about.html)
- [ ] Check for some type of Builder pattern in Dart (should also work in 
a Flutter context)
  https://dev.to/inakiarroyo/the-builder-pattern-in-dart-efg
- [ ] Check the Python/Java/NodeJS Bindings
- [ ] Go for Python native, because it seems the easiest to understand wrapper
  - [ ] how is the client wrapper implemented
  - [ ] how is the dynamic library generated
  - [ ] how are the language specific types implemented
- [ ] Implement some first Dart Types
- [ ] Implement Error Handling via FFI (see Python)

TODO:

- [ ] Implement Dart Types (Client, Message etc.)
- [ ] Implement FFI-enabled Rust Wrapper around Client (take a look at other
  bindings)
- [ ] Implement Plugin for Flutter native
- [ ] Implement Plugin Flutter Web (WASM)
- [ ] Ensure null safety in Dart/Flutter implementation

Notes:

[Dart Native vs. Dart Web](https://dart.dev/overview#platform)  
[Dart Meets Rust: a match made in heaven](https://dev.to/sunshine-chain/dart-meets-rust-a-match-made-in-heaven-9f5)  
[Dart and Rust: the async story](https://dev.to/sunshine-chain/rust-and-dart-the-async-story-3adk)  
[Null safety in Dart](https://dart.dev/null-safety/migration-guide)

# Requirements

Ensure you have first installed the required dependencies for the library
[here](https://github.com/iotaledger/iota.rs/blob/dev/README.md).

## Installation

Clone project

```
$ git clone https://github.com/iotaledger/iota.rs
```

Build the rust library

```
$ cd iota.rs/bindings/dart/native
$ cargo build
```
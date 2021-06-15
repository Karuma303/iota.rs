# iota.rs

**Official IOTA Client library**

The goal of this library is to have a `single source of truth` for basic 
(stateless) client functionality, which means there is one reference 
implementation in [Rust](https://www.rust-lang.org/) 
and several [bindings](#bindings) to other programming languages.

This library allows you to do the following:

* Create messages with indexation and transaction payloads
* Get messages and outputs
* Sign transactions
* Generate addresses
* Interact with an IOTA node

For building higher-level applications that handle for example IOTA 
value transactions in a stateful way, we recommend using our official wallet 
library [wallet.rs](https://github.com/iotaledger/wallet.rs).

We also provide a client library written in C that you can find 
[here](https://github.com/iotaledger/iota.c) and one written in Go
that you can find [here](https://github.com/iotaledger/iota.go).

## Requirements

To use the library, we recommend you update Rust to latest stable version 
[`$ rustup update stable`](https://github.com/rust-lang/rustup.rs#keeping-rust-up-to-date). 
Nightly should be fine but some changes might not be compatible.

`no_std` is currently not supported, but we are working on it in 
[Bee](https://github.com/iotaledger/bee) and will provide it as feature once 
the new implementation is ready.

## Using the library

Using the library is easy, just add it as a dependency in your `Cargo.toml`:

```toml
[dependencies]
iota-client = "1.0.0"
```

or for the latest changes

```toml
[dependencies]
iota-client = { git = "https://github.com/iotaledger/iota.rs", branch = "dev" }
```

You can use the library then in your code with 
```rust 
use iota_client;
```

*Note: When using the "MQTT" feature, connecting to a MQTT broker using raw ip 
doesn't work with TCP. This is a limitation of  [rustls](https://docs.rs/rustls).*

## API documentation

You can find the API documentation
[here](https://client-lib.docs.iota.org/docs/doc/iota_client/index.html), 
or generate it yourself.

If you'd like to explore the implementation in more depth, the following 
command generates docs for the whole crate, including private modules:

```bash
cargo doc --document-private-items --no-deps --open
```

## Examples

You can see the examples in the [examples](examples/.) directory and try them 
like:

```bash
cargo run --example 01_get_info
```

For the examples where a seed is required you have to rename `.env.example` 
to `.env`.

## Bindings

We currently provide bindings to these programming languages:

* [Node.js binding](bindings/nodejs/.)
* [Python binding](bindings/python/.)

## Joining the discussion

If you want to get involved in the community, need help with setting up, have 
any issues or just want to discuss IOTA with other people, feel free to join 
our [Discord](https://discord.iota.org/) in the #clients-dev 
and #clients-discussion channels.

## License

The Apache 2.0 license can be found [here](LICENSE).

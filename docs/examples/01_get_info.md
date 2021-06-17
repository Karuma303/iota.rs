# Connect to a node

## The `Client` class

All functions of the client library that require communication with an 
[IOTA node] like Hornet, Bee or GoShimmer must be called through the `Client` 
class.
This class offers a high-level abstraction of all the low-level functions that 
are used to handle the network communication between the client and a node.

The `Client` class can be instantiated and configured with the help of the 
`ClientBuilder` class.

The client library is designed to automatically choose a lot of
default settings that are very convenient for development. Depending on the
network type that you choose (`testnet` or `mainnet`) it will automatically
connect to a running [IOTA node] from that network.  
[TODO: is this also true for the mainnet???]

## Get some info about a node

Here is a very simple example that shows how to connect to a node of 
the [IOTA testnet] and get some information about this node.

<details open>
<summary>Node.js</summary>

```javascript
{{#include ../../bindings/nodejs/examples/01_get_info.js}}
```
</details>
<details>
  <summary>Rust</summary>

```rust
{{#include ../../examples/01_get_info.rs}}
```
</details>
<details>
  <summary>Python</summary>

```python
{{#include ../../bindings/python/examples/01_get_info.py}}
```
</details>

<details>
  <summary>Java</summary>

  [TODO]
</details>

Output example of `getInfo()` function of the `ClientBuilder` instance:

```json
{
   "nodeinfo":{
      "name":"HORNET",
      "version":"0.6.0-alpha",
      "isHealthy":true,
      "networkId":"migration",
      "bech32HRP":"atoi",
      "minPoWScore":100,
      "messagesPerSecond":4.2,
      "referencedMessagesPerSecond":4.1,
      "referencedRate":97.61904761904762,
      "latestMilestoneTimestamp":1618139001,
      "latestMilestoneIndex":7092,
      "confirmedMilestoneIndex":7092,
      "pruningIndex":0,
      "features":[
         "PoW"
      ]
   },
   "url":"https://api.lb-0.testnet.chrysalis2.com"
}
```

The most important properties:
* `isHealthy`: indicates whether the given node is in sync with the network and
  so it is safe to use it. Even if a node is up and running it may not be fully
  prepared to process your API calls properly. The node should be "synced",
  meaning should be aware of all TXs in the Tangle. It is better to avoid
  not fully synced nodes
* `bech32HRP`: indicates whether the given node is a part of testnet (`atoi`)
  or mainnet (`iota`). See more info regarding
  [IOTA address format](../welcome.md#iota-15-address-anatomy)

_Please note, when using node load balancers then mentioned health check may be
quite useless since follow-up API calls may be served by different node behind
the load balancer that may have not been actually checked. One should be aware
of this fact and trust the given load balancer participates only with nodes
that are in healthy state. `iota.rs` library additionally supports a management
of internal node pool and so load-balancer-like behavior can be mimicked using
this feature locally._

Needless to say, the `ClientBuilder` helper class provides several chaining
calls via which the process can be closely managed.

The most common ones:
* `.network(str)`: can be `testnet` or `mainnet`. It instructs the library
  whether to automatically select testnet nodes or mainnet nodes
* `.node(url)`: specify address of actual running IOTA node that should be used
  to communicate with (in format `https://node:port`), for example:
  https://api.lb-0.testnet.chrysalis2.com:443
* `.nodePoolUrls(urls)`: library also supports a management of pool of nodes.
  You can provide a list of nodes and library manages access to them automatically
  (selecting them based on their sync status)
* `.localPow(bool)`: `.localPow (True)` (by default) means a `Proof-of-work` is
  done locally and not remotely
* `.disableNodeSync()`: when called, it means library also uses nodes that
  _are not_ in sync with network. This parameter is usually useful if one would
  like to interact with local test node that is not fully synced. This parameter
  should not be used in production

If `.nodePoolUrls(urls)` is provided then the library periodically checks in
some interval (call `.nodeSyncInterval(interval)`) whether node is in sync or
not.

Example of use of additional initialization chaining calls, such as leveraging
a custom node:

```javascript
{{#include ../../../bindings/nodejs/examples/01b_get_info.js}}
```

[IOTA node]: https://chrysalis.docs.iota.org/node-software/node-software.html
[IOTA testnet]: https://chrysalis.docs.iota.org/testnet.html

[TODO: this is just a copy of the very first chapter in the examples
markdown file of the NodeJS client lib!]

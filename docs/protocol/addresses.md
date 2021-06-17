# Addresses in the IOTA tangle

## Seed

> Please note: It is not recommended to store passwords/seeds on host's
> environment variables or in the source code in a production setup!
> Please make sure you follow our
> [backup and security](https://chrysalis.docs.iota.org/guides/backup_security.html)
> recommendations for production use!

## Address/key space

[TODO: rewrite this introduction]

Before an actual address generation process, let's quickly focus on
[BIP32](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)
standard that describes an approach to _Hierarchical Deterministic Wallets_.
The standard was improved by
[BIP44](https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki) lately.

These standards define a tree structure as a base for address and key space
generation which is represented by a `derivation path`:

```plaintext
m / purpose / coin_type / account / change / address_index
```

* `m`: a master node (seed)
* `purpose`: constant which is {44}
* `coin_type`: a constant set for each crypto currency. IOTA = 4218,
  for instance.
* `account`: account index. Zero-based increasing `int`. This level splits the
  address/key space into independent branches (ex. user identities) which each has
  own set of addresses/keys
* `change`: change index which is `{0, 1}`, also known as `wallet chain`.<br />
  There are two independent chain of addresses/keys. `0` is reserved for public
  addresses (for coin receival) and `1` is reserved for internal (also known as
  change) addresses to which transaction change is returned. _IOTA is totally fine
  with address reuse, and so it is, technically speaking, totally valid to return
  transaction change to the same originating address. So it is up to developers
  whether to leverage it or not. `iota.rs` library and its sibling `wallet.rs`
  help with either scenario_
* `address_index`: address index. Zero-based increasing `int` that indicates an
  address index

As outlined, there is a quite large address/key space that is secured by a
single unique seed.

And there are few additional interesting notes:
* Each level defines a completely different subtree (subspace) of addresses/keys
  and those are never mixed up
* The hierarchy is ready to "absorb" addresses/keys for many different coins at
  the same time (`coin_type`), and all those coins are secured by the same seed.<br />
  (So basically any BIP32/44-compliant wallet is potentially able to manage any
  BIP32/44-compliant coin(s))
* There may be also other `purposes` in the future however let's consider a
  single purpose as of now. The constant `44` stands for BIP44
* The standard was agreed upon different crypto communities, although not all
  `derivation path` components are always in active use. For example, `account` is
  not always actively leveraged across crypto space (if this is a case then there
  is usually `account=0` used)
* Using different `accounts` may be useful to split addresses/key into some
  independent spaces and it is up to developers to implement.<br />
  _Please note, it may have a negative impact on a performance while
  [account discovery](https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki#account-discovery)
  phase. So if you are after using many multiple accounts then you may be
  interested in our stateful library
  [wallet.rs](https://chrysalis.docs.iota.org/libraries/wallet.html) that
  incorporates all business logic needed to efficiently manage independent
  accounts. Also our
  [exchange guide](https://chrysalis.docs.iota.org/guides/exchange_guide.html)
  provides some useful tips how different accounts may be leveraged_

![address_generation](address_generation.svg)

So in case of IOTA, the derivation path of address/key space is `[seed]/44/4218/{int}/{0,1}/{int}`.
The levels `purpose` and `coin_type` are given, the rest levels are up to
developers to integrate.
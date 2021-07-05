# Overview

The IOTA client library is a stateless library that provides a high level
abstraction on top of IOTA node software to help interact with the IOTA network
in a user-friendly way and allows you to do the following, for instance:

- Create messages and transactions
- Sign transactions
- Generate addresses
- Interact with an IOTA node

The library provides two types of API calls under a common interface.

## Full node API calls

These calls are basically translated to native node REST API calls. For a full
documentation of the available functions, please consult the
[node REST API reference][Node REST API].

## General high level API calls 

These are convenience functions with some typical default parameters in order to
use them in a straightforward manner. They typically implement several
recommended steps for a given task. Please consult
the [High Level API Specification] for details about the implementation.

## High level layered overview

![iota layers overview](layered_overview.svg)

[Node REST API]:https://editor.swagger.io/?url=https://raw.githubusercontent.com/rufsam/protocol-rfcs/master/text/0026-rest-api/rest-api.yaml
[High Level API Specification]:../specs/README.md
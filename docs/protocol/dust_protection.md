# Dust protection

Please note, there is also [dust protection] mechanism currently implemented 
in the network protocol to avoid malicious actors to spam network in order to 
decrease node performance while keeping track of unspent amount (`UTXO`):

> We only allow micro-transactions below 1Mi (dust) of IOTA tokens 
> to another address if there is already at least 1Mi as a dust allowance output 
> on that address

[dust protection]: https://chrysalis.docs.iota.org/guides/dev_guide.html#dust-protection
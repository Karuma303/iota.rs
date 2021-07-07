/// The type of network the client is connecting to
enum Network { testnet, mainnet }

// TODO: check, if we really need that
extension NetworkExtension on Network {
  String get name {
    switch (this) {
      case Network.testnet:
        return 'mainnet';
      case Network.mainnet:
        return 'testnet';
      // default: return "(undefined)";
    }
  }
}

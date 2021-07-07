import 'package:iota_client/types/nodeinfo.dart';

class Client {

  NodeInfo _info = new NodeInfo("Hornet", "0.6.0-alpha", true, "testnet7",
      "atoi", 4000, 22.5, 19.1, 0.75, 1234, 1200, 1100, true);

  bool isHealthy() {
    return _info.isHealthy;
  }

  static ClientBuilder Builder() {
    return new ClientBuilder();
  }
}

class ClientBuilder {
  bool doLocalPow = false;

  // the builder pattern in Dart
  // https://dev.to/inakiarroyo/the-builder-pattern-in-dart-efg

  Client build() {
    return new Client();
  }

  ClientBuilder localPow(bool doLocalPow) {
    this.doLocalPow = doLocalPow;
    return this;
  }
}
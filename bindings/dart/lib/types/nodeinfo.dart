class NodeInfo {
  NodeInfo(
      this.name,
      this.version,
      this.isHealthy,
      this.networkId,
      this.bech32HRP,
      this.minPowScore,
      this.messagesPerSecond,
      this.referencedMessagesPerSecond,
      this.referencedRate,
      this.latestMilestoneTimestamp,
      this.confirmedMilestoneIndex,
      this.pruningIndex,
      this.remotePow);

  final String name; // e.g. "Hornet"
  final String version; // e.g. "0.6.0-alpha"
  final bool isHealthy;
  final String networkId; // e.g. "testnet7"
  final String bech32HRP; // e.g. "atoi"
  final int minPowScore; // e.g. 4000
  final double messagesPerSecond;
  final double referencedMessagesPerSecond;
  final double referencedRate;
  final int latestMilestoneTimestamp;
  final int confirmedMilestoneIndex;
  final int pruningIndex;
  final bool remotePow; // or List<String> features;
}
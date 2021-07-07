import 'package:iota_client/types/client.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('default client can be instantiated', () {
    final Client c = Client.Builder().build();
    expect(c, isNotNull);
  });

  test('advanced client can be instantiated', () {
    final Client c = Client.Builder()
        .localPow(true)
        .build();
    expect(c, isNotNull);
  });
}

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:optimizely/client.dart';
import 'package:optimizely/src/config/optimizely_config/optimizely_config.dart';
import 'package:optimizely/factory.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('Sample OptimizelyConfig test', () async {
    String data = await rootBundle.loadString('assets/100_entities.json');
    OptimizelyFactory factory = OptimizelyFactory(data);
    OptimizelyClient client = factory.client();
    expect(client != null, equals(true));
    OptimizelyConfig config = client.getOptimizelyConfig();
    expect(config != null, equals(true));
  });
}

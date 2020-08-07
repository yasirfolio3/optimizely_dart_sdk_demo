import 'package:optimizely/src/config/config_manager.dart';
import 'package:optimizely/src/config/optimizely_config/optimizely_config.dart';

export 'package:optimizely/src/config/optimizely_config/optimizely_config.dart';
export 'package:optimizely/src/config/optimizely_config/optimizely_experiment.dart';
export 'package:optimizely/src/config/optimizely_config/optimizely_feature.dart';
export 'package:optimizely/src/config/optimizely_config/optimizely_variable.dart';
export 'package:optimizely/src/config/optimizely_config/optimizely_variation.dart';

class OptimizelyClient {
  ProjectConfigManager _configManager;

  factory OptimizelyClient.withConfigManager(
      ProjectConfigManager configManager) {
    OptimizelyClient client = OptimizelyClient(configManager);
    return client;
  }

  OptimizelyClient(this._configManager);

  OptimizelyConfig getOptimizelyConfig() {
    return _configManager.getOptimizelyConfig();
  }
}

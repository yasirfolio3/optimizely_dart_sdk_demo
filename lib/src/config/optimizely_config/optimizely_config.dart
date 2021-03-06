import 'package:optimizely/src/config/optimizely_config/optimizely_feature.dart';
import 'package:optimizely/src/config/optimizely_config/optimizely_experiment.dart';
import 'package:optimizely/src/config/optimizely_config/optimizely_variable.dart';
import 'package:optimizely/src/config/optimizely_config/optimizely_variation.dart';
import 'package:optimizely/src/config/project_config.dart';
import 'package:optimizely/src/entities/entities.dart';
part 'optimizely_config.g.dart';

class OptimizelyConfig {
  String revision;
  Map<String, OptimizelyExperiment> experimentsMap;
  Map<String, OptimizelyFeature> featuresMap;

  factory OptimizelyConfig.fromProjectConfig(ProjectConfig config) {
    if (config == null) {
      return null;
    }
    List<Feature> featuresList = config.getFeatureList();
    List<Experiment> experimentsList = config.getExperimentList();
    String revision = config.getRevision();

    Map<String, Variable> variableByIDMap = _getVariableByIDMap(featuresList);

    Map<String, OptimizelyExperiment> experimentsMap =
        _getExperimentMap(featuresList, experimentsList, variableByIDMap);
    return OptimizelyConfig(
        revision, experimentsMap, _getFeatureMap(featuresList, experimentsMap));
  }

  OptimizelyConfig(this.revision, this.experimentsMap, this.featuresMap);

  factory OptimizelyConfig.fromJson(Map<String, dynamic> json) =>
      _$OptimizelyConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OptimizelyConfigToJson(this);
}

Map<String, Variable> _getVariableByIDMap(List<Feature> features) {
  Map<String, Variable> variableIDMap = {};
  features.forEach((feature) {
    feature.variableMap.forEach((key, variable) {
      variableIDMap[variable.id] = variable;
    });
  });
  return variableIDMap;
}

Map<String, Map<String, OptimizelyVariable>> _getExperimentVariablesMap(
    List<Feature> features) {
  Map<String, Map<String, OptimizelyVariable>> experimentVariableMap = {};
  features.forEach((feature) {
    Map<String, OptimizelyVariable> optimizelyVariableMap = {};
    feature.variableMap.forEach((key, variable) {
      optimizelyVariableMap[variable.key] = OptimizelyVariable(
          variable.id, variable.key, "string", variable.defaultValue);
    });
    feature.featureExperiments.forEach((experiment) {
      experimentVariableMap[experiment.key] = optimizelyVariableMap;
    });
  });
  return experimentVariableMap;
}

Map<String, OptimizelyExperiment> _getExperimentMap(List<Feature> features,
    List<Experiment> experiments, Map<String, Variable> variableByIDMap) {
  Map<String, OptimizelyExperiment> optlyExperimentMap = {};
  Map<String, Map<String, OptimizelyVariable>> experimentVariablesMap =
      _getExperimentVariablesMap(features);

  experiments.forEach((experiment) {
    Map<String, OptimizelyVariation> optlyVariationsMap = {};
    experiment.variations.forEach((key, variation) {
      Map<String, OptimizelyVariable> optlyVariablesMap = {};
      if (experimentVariablesMap.containsKey(experiment.key)) {
        experimentVariablesMap[experiment.key].forEach((key, value) {
          optlyVariablesMap[key] = value;
        });
      }
      variation.variables.forEach((key, variable) {
        if (experiment.isFeatureExperiment && variation.featureEnabled) {
          if (variableByIDMap.containsKey(variable.id)) {
            Variable convertedVariable = variableByIDMap[variable.id];
            OptimizelyVariable optlyVariable = OptimizelyVariable(
                convertedVariable.id,
                convertedVariable.key,
                convertedVariable.type,
                variable.value);
            optlyVariablesMap[convertedVariable.key] = optlyVariable;
          }
        }
      });
      OptimizelyVariation optVariation = OptimizelyVariation(variation.id,
          variation.key, variation.featureEnabled, optlyVariablesMap);
      optlyVariationsMap[variation.key] = optVariation;
    });
    OptimizelyExperiment optlyExperiment =
        OptimizelyExperiment(experiment.id, experiment.key, optlyVariationsMap);
    optlyExperimentMap[experiment.key] = optlyExperiment;
  });
  return optlyExperimentMap;
}

Map<String, OptimizelyFeature> _getFeatureMap(
    List<Feature> features, Map<String, OptimizelyExperiment> experimentsMap) {
  Map<String, OptimizelyFeature> optlyFeatureMap = {};
  features.forEach((feature) {
    Map<String, OptimizelyVariable> optlyFeatureVariablesMap = {};
    feature.variableMap.forEach((key, featureVariable) {
      OptimizelyVariable optlyVariable = OptimizelyVariable(featureVariable.id,
          featureVariable.key, "string", featureVariable.defaultValue);
      optlyFeatureVariablesMap[featureVariable.key] = optlyVariable;
    });

    Map<String, OptimizelyExperiment> optlyExperimentMap = {};
    feature.featureExperiments.forEach((experiment) {
      optlyExperimentMap[experiment.key] = experimentsMap[experiment.key];
    });

    OptimizelyFeature optlyFeature = OptimizelyFeature(
        feature.id, feature.key, optlyExperimentMap, optlyFeatureVariablesMap);
    optlyFeatureMap[feature.key] = optlyFeature;
  });
  return optlyFeatureMap;
}

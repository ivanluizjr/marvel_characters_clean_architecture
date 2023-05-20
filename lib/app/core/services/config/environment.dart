import 'base_config.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String dev = 'DEV';
  static const String staging = 'STAGING';
  static const String prod = 'PROD';

  late IBaseConfig config;

  initiConfig(String environment) {
    config = _getConfig(environment);
  }

  IBaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdConfig();

      case Environment.staging:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}

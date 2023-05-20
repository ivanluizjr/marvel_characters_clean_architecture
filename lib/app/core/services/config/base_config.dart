abstract class IBaseConfig {
  String get apiHost;
  bool get useHttps;
  bool get trackEvents;
  bool get reportErrors;
}

class DevConfig implements IBaseConfig {
  @override
  String get apiHost => 'http://gateway.marvel.com/v1/public';

  @override
  bool get reportErrors => false;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => false;
}

class StagingConfig implements IBaseConfig {
  @override
  String get apiHost => 'staging.url.com';

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => true;
}

class ProdConfig implements IBaseConfig {
  @override
  String get apiHost => 'prod.com';

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => true;

  @override
  bool get useHttps => true;
}

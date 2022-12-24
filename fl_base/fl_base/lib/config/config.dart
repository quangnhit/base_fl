import 'package:fl_base/config/dev.config.dart';
import 'package:fl_base/config/product.config.dart';
import 'package:fl_base/config/stg.config.dart';

class AppConfig {
  static late BaseConfig config;

  static void setDev() {
    config = DevConfig();
  }

  static void setProd() {
    config = ProductConfig();
  }

  static void setStg() {
    config = StagingConfig();
  }

  static void setEnvironment({required BaseConfig valueConfig}) {
    config = valueConfig;
  }
}

abstract class BaseConfig {
  String get apiSeverUrl;
}

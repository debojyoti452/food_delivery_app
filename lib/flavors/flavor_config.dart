import 'package:flutter/material.dart';

enum BuildFlavor { dev, prod, staging }

class FlavorConfig {
  //Singleton Initialization
  static final FlavorConfig _obj = FlavorConfig._internal();

  static FlavorConfig get instance => _obj;

  //instance
  BuildFlavor? buildFlavor;

  String? baseUrl;

  factory FlavorConfig() {
    return _obj;
  }

  FlavorConfig._internal();

  void setupFlavor({@required BuildFlavor? flavorConfig}) {
    switch (flavorConfig) {
      case BuildFlavor.dev:
        {
          buildFlavor = BuildFlavor.dev;
          baseUrl = 'base url';
        }
        break;
      case BuildFlavor.prod:
        {
          buildFlavor = BuildFlavor.prod;
          baseUrl = 'base url';
        }
        break;
      case BuildFlavor.staging:
        {
          buildFlavor = BuildFlavor.staging;
          baseUrl = 'base url';
        }
        break;
      default:
        {
          buildFlavor = BuildFlavor.dev;
          baseUrl = 'base url';
        }
        break;
    }
  }

  static bool isProduction() => _obj.buildFlavor == BuildFlavor.prod;

  static bool isDevelopment() => _obj.buildFlavor == BuildFlavor.dev;

  static bool isStaging() => _obj.buildFlavor == BuildFlavor.staging;
}

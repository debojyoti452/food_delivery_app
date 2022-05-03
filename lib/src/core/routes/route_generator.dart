import 'package:flutter/material.dart';
import 'package:ubx_vinne_admin_web/src/ui/login/registration_screen.dart';

import '../../ui/walkthrough/walkthrough_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    // var args = routeSettings.arguments == null ? null : routeSettings.arguments as ScreenArgs;

    switch (routeSettings.name) {
      case ScreenConstant.walkThroughScreen:
        return MaterialPageRoute(
          builder: (builder) => WalkThroughScreen(),
          settings: routeSettings,
        );

      case ScreenConstant.registrationScreen:
        return MaterialPageRoute(
          builder: (builder) => RegistrationScreen(),
          settings: routeSettings,
        );

      default:
        return MaterialPageRoute(
          builder: (builder) => WalkThroughScreen(),
          settings: routeSettings,
        );
    }
  }
}

mixin ScreenConstant {
  static const walkThroughScreen = 'walkThroughScreen';
  static const registrationScreen = 'registrationScreen';
}

class ScreenArgs {
  final Map<String, dynamic> map;

  ScreenArgs({required this.map});
}

import 'package:flutter/material.dart';
import 'package:ubx_vinne_admin_web/src/ui/home/dashboard_screen.dart';
import 'package:ubx_vinne_admin_web/src/ui/login/registration_screen.dart';
import 'package:ubx_vinne_admin_web/temp_canvas.dart';

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

      case ScreenConstant.dashboardScreen:
        return MaterialPageRoute(
          builder: (builder) => DashboardScreen(),
          settings: routeSettings,
        );

      case ScreenConstant.tempCanvas:
        return MaterialPageRoute(
          builder: (builder) => TempCanvas(),
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
  static const dashboardScreen = 'dashboardScreen';
  static const tempCanvas = 'canvasScreen';
}

class ScreenArgs {
  final Map<String, dynamic> map;

  ScreenArgs({required this.map});
}

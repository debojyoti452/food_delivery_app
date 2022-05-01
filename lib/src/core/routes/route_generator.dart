import 'package:flutter/material.dart';

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
}

class ScreenArgs {
  final Map<String, dynamic> map;

  ScreenArgs({required this.map});
}

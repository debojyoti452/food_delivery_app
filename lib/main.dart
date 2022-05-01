import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubx_vinne_admin_web/src/utils/themes/app_theme.dart';

import 'src/core/routes/route_generator.dart';
import 'src/ui/walkthrough/walkthrough_screen.dart';
import 'src/utils/constants/app_strings.dart';

class BaseApp extends StatelessWidget {
  BaseApp({Key? key}) : super(key: key);

  final botToastBuilder = BotToastInit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context) {
        return MaterialApp(
          title: AppStrings.appName,
          theme: AppTheme.lightTheme,
          home: const WalkThroughScreen(),
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: ScreenConstant.walkThroughScreen,
          builder: (context, child) {
            child = botToastBuilder(context, child);
            return child;
          },
        );
      },
    );
  }
}

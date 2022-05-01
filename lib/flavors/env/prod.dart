import 'package:flutter/material.dart';

import '../../src/base/main_common.dart';
import '../flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig().setupFlavor(flavorConfig: BuildFlavor.prod);
  await mainCommon();
}

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../main.dart';

Logger logger = Logger(printer: PrettyPrinter(lineLength: 100000));

Future<void> mainCommon() async {
  runApp(BaseApp());
}

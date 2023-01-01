import 'dart:async';

import 'package:fl_base/base/base_run_main.dart';
import 'package:fl_base/config/dev.config.dart';

Future<void> main() async {
  BaseRunMain.runMainApp(config: DevConfig());
}

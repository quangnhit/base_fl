import 'package:fl_base/base/base_controller.dart';

class ControllerManager {
  factory ControllerManager() {
    return _singleton;
  }

  ControllerManager._internal();

  static final ControllerManager _singleton = ControllerManager._internal();

  Rx<String> currentController = ''.obs;
}

import 'dart:async';

import 'package:fl_base/global/app_log.dart';
import 'package:flutter/material.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  factory LifecycleEventHandler() {
    return _singleton;
  }

  LifecycleEventHandler._internal() {
    WidgetsBinding.instance.addObserver(this);
  }
  static final LifecycleEventHandler _singleton =
      LifecycleEventHandler._internal();

  final StreamController<AppLifecycleState> _notifyLifecycle =
      StreamController<AppLifecycleState>.broadcast();

  Stream<AppLifecycleState> get streamNotifyLifecycle =>
      _notifyLifecycle.stream;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    _notifyLifecycle.add(state);
    AppLog.log.info('[AppLifecycleState]: => ${state.name}');
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        break;
    }
  }
}

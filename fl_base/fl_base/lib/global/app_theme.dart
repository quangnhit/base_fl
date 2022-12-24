import 'package:fl_base/base/base_controller.dart';
import 'package:fl_base/global/app_theme_black.dart';
import 'package:fl_base/global/app_theme_bright.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app_base_color.dart';
import 'app_const.dart';

enum AppThemeType { black, bright }

AppTheme baseColor = AppThemeBlack();

abstract class AppTheme with BaseColor {
  ThemeData get theme;
}

class AppThemeBase {
  AppThemeBase() {
    ever(_appTheme, (AppThemeType type) {
      baseColor = theme;
      Get.changeTheme(theme.theme);
      Get.forceAppUpdate();
    });

    _initThemeModeFromSharedPref();
  }

  static final Rx<AppThemeType> _appTheme = AppThemeType.black.obs;

  AppThemeType get appTheme => _appTheme.value;

  AppTheme get theme =>
      appTheme == AppThemeType.black ? AppThemeBlack() : AppThemeBright();

  ThemeData get themeData => theme.theme;

  void changeAppTheme(AppThemeType appThemeType) {
    saveThemeModeInSharedPref(appThemeType);
  }

  Future<void> _initThemeModeFromSharedPref() async {
    final String? themeModeFromPref = GetStorage().read(AppConst.keyThemeMode);

    _appTheme.value = themeModeFromPref == null ||
            themeModeFromPref == AppThemeType.black.toString()
        ? AppThemeType.black
        : AppThemeType.bright;

    baseColor = theme;
  }

  static Future<void> saveThemeModeInSharedPref(AppThemeType type) async {
    if (_appTheme.value != type) {
      _appTheme.value = type;
      GetStorage().write(AppConst.keyThemeMode, type.toString());
    }
  }
}

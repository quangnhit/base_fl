import 'package:fl_base/base/base_controller.dart';
import 'package:fl_base/global/app_const.dart';
import 'package:fl_base/global/app_dimension.dart';
import 'package:fl_base/global/app_text_style.dart';
import 'package:fl_base/global/app_theme.dart';
import 'package:fl_base/utils/localization_service.dart';
import 'package:flutter/material.dart';

export 'package:flutter/material.dart';

mixin BaseMixin {
  AppTheme get color => Get.find<AppThemeBase>().theme;

  bool get vn => LocalizationService.locale.languageCode == AppConst.langVI;

  AppTextStyle get textStyle => AppTextStyle.share;

  AppSized get sized => AppSized.share;
}

mixin MixinWidget<T extends StatelessWidget> on BaseMixin {}

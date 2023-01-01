import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'app_text_style.dart';
import 'app_theme.dart';

class AppThemeBright extends AppTheme {
  AppTextStyle get textStyle => AppTextStyle.share;

  @override
  ThemeData get theme => ThemeData(
        // scaffoldBackgroundColor: background0,
        // backgroundColor: background0,
        // primaryColor: primary,
        // dialogBackgroundColor: grey90,
        fontFamily: 'SF-REGULAR',
        appBarTheme: _buildAppBarTheme,
        bottomAppBarTheme: _buildBottomAppBarTheme,
        dialogTheme: _buildDialogTheme,
      );

  AppBarTheme get _buildAppBarTheme => AppBarTheme(
        // backgroundColor: grey90, centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: colorBlack),
        // textTheme: TextTheme(),
        titleTextStyle: TextStyle(
          color: colorBlack,
          fontSize: 16,
          fontFamily: 'SF-REGULAR',
        ),
      );
  BottomAppBarTheme get _buildBottomAppBarTheme =>
      const BottomAppBarTheme(elevation: 0);

  DialogTheme get _buildDialogTheme => const DialogTheme(elevation: 0);
  @override
  Color get randomColor =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Color get appBaseColor => Colors.orange;

  @override
  Color get colorBlack => Colors.black;

  @override
  Color get white => const Color(0xFFFFFFFF);
}

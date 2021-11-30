import 'package:flutter/material.dart';

import 'custom_taav_theme.dart';

class CustomMaterialTheme {
  final String fontFamily;

  CustomMaterialTheme({required final this.fontFamily});

  ThemeData get themeData => ThemeData(
        fontFamily: fontFamily,
        primarySwatch: CustomTaavTheme.primaryColor,
        brightness: Brightness.dark,
        primaryColor: CustomTaavTheme.primaryColor,
        primaryColorBrightness: Brightness.light,
        primaryColorLight: CustomTaavTheme.primaryColor[200],
        primaryColorDark: CustomTaavTheme.primaryColor[900],
        accentColor: CustomTaavTheme.accentColor,
        accentColorBrightness: Brightness.light,
        canvasColor: CustomTaavTheme.backgroundColor,
        scaffoldBackgroundColor: CustomTaavTheme.backgroundColor,
        bottomAppBarColor: const Color(0xffffffff),
        cardColor: const Color(0xffffffff),
        dividerColor: const Color(0x1f000000),
        highlightColor: const Color(0x66bcbcbc),
        splashColor: const Color(0x66c8c8c8),
        selectedRowColor: const Color(0xfff5f5f5),
        unselectedWidgetColor: const Color(0x8a000000),
        disabledColor: CustomTaavTheme.disabledColor,
        buttonColor: const Color(0xffe0e0e0),
        toggleableActiveColor: const Color(0xff1e88e5),
        secondaryHeaderColor: const Color(0xffe3f2fd),
        backgroundColor: CustomTaavTheme.backgroundColor,
        dialogBackgroundColor: CustomTaavTheme.backgroundColor,
        indicatorColor: const Color(0xff2196f3),
        hintColor: const Color(0x8a000000),
        errorColor: CustomTaavTheme.dangerColor,
      );
}

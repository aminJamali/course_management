import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

import '../custom_taav_theme.dart';

final descriptionTextStyle = TaavTextFormFieldStyleData.toStyle(
  themeName: CustomTaavTheme.descriptionTextFormFiledThemeName,
  cursorColor: CustomTaavTheme.borderColor,
  contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
  contentTextStyle: (final StyleData style) => TextStyle(
      fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
      color: CustomTaavTheme.liteTextColor),
  labelTextStyle: (final StyleData style) => TextStyle(
      fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
      fontWeight: FontWeight.bold,
      color: CustomTaavTheme.liteTextColor),
  hintTextStyle: (final StyleData style) => TextStyle(
      fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
      color: CustomTaavTheme.liteTextColor.withOpacity(0.54)),
  helperTextStyle:
      const TextStyle(fontSize: 12, color: CustomTaavTheme.liteTextColor),
  errorTextStyle: const TextStyle(
      fontSize: 12, color: Color(0xFFBC0000), fontWeight: FontWeight.w500),
  counterTextStyle: const TextStyle(fontSize: 12, color: TaavColors.black54),
  prefixTextStyle: (final StyleData style) => TextStyle(
      fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
      fontWeight: FontWeight.bold,
      color: CustomTaavTheme.liteTextColor),
  suffixTextStyle: 'textFieldFilled-prefixTextStyle',
  fillColor: TaavColors.transparent,
  iconColor: CustomTaavTheme.liteTextColor,
  enabledBorder: BorderSide.none,
  focusedBorder: BorderSide.none,
  errorBorder: BorderSide.none,
  focusedErrorBorder: BorderSide.none,
  disabledBorder: BorderSide.none,
  isFilled: true,
  isOutlined: true,
  shape: TaavWidgetShape.rectangle,
);

import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

import '../custom_taav_theme.dart';

final searchTextStyle = TaavTextFormFieldStyleData.toStyle(
  themeName: CustomTaavTheme.searchTextFormFiledThemeName,
  cursorColor: CustomTaavTheme.borderColor,
  contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
  contentTextStyle: (final StyleData style) => TextStyle(
      fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
      color: style.get<Color>('textBase-contentColor')),
  labelTextStyle: (final StyleData style) => TextStyle(
      fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
      fontWeight: FontWeight.bold,
      color: CustomTaavTheme.textColor),
  hintTextStyle: (final StyleData style) => TextStyle(
      fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
      color: CustomTaavTheme.textColor.withOpacity(0.54)),
  helperTextStyle:
      const TextStyle(fontSize: 12, color: CustomTaavTheme.textColor),
  errorTextStyle: const TextStyle(
      fontSize: 12, color: Color(0xFFBC0000), fontWeight: FontWeight.w500),
  counterTextStyle: const TextStyle(fontSize: 12, color: TaavColors.black54),
  prefixTextStyle: (final StyleData style) => TextStyle(
      fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
      fontWeight: FontWeight.bold,
      color: CustomTaavTheme.textColor),
  suffixTextStyle: 'textFieldFilled-prefixTextStyle',
  fillColor: TaavColors.transparent,
  iconColor: CustomTaavTheme.textColor,
  enabledBorder: const BorderSide(
    color: TaavColors.black38,
    width: 0.3,
  ),
  focusedBorder: const BorderSide(
    color: TaavThemes.primaryColor,
    width: 0.8,
  ),
  errorBorder: const BorderSide(
    color: Color(0xFFBC0000),
    width: 0.5,
  ),
  focusedErrorBorder: const BorderSide(
    color: Color(0xFFA80101),
    width: 0.8,
  ),
  disabledBorder: const BorderSide(
    color: Colors.blueGrey,
    width: 0.3,
  ),
  isFilled: true,
  isOutlined: true,
  shape: TaavWidgetShape.rectangle,
);

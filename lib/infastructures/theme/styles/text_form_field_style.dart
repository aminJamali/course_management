import 'package:flutter/material.dart';
import 'package:taav_ui/src/components/taav_text_field/style/text_field_styles.dart';
import 'package:taav_ui/taav_ui.dart';

import '../custom_taav_theme.dart';
import 'description_text_form_filed_style.dart';
import 'search_text_form_filed_style.dart';

final textFormFieldStyle = textFormFieldStyles.copyWith({
  'textFieldFilled-iconColor': CustomTaavTheme.borderColor,
  'textFieldFilled-cursorColor': CustomTaavTheme.borderColor,
  'textFieldFilled-fillColor': CustomTaavTheme.backgroundColor,
  'textFieldFilled-isFilled': true,
  'textFieldFilled-shape': TaavWidgetShape.rectangle,
  'textFieldFilled-helperTextStyle': const TextStyle(
    fontSize: 12,
    color: TaavColors.black54,
  ),
  'textFieldFilled-labelTextStyle': const TextStyle(
    fontSize: 12,
    color: CustomTaavTheme.textColor,
    fontWeight: FontWeight.w500,
  ),
  'textFieldFilled-hintTextStyle': TextStyle(
      fontSize: 16, color: CustomTaavTheme.textColor.withOpacity(0.54)),
  'textFieldFilled-errorTextStyle': const TextStyle(
    fontSize: 12,
    color: CustomTaavTheme.dangerColor,
    fontWeight: FontWeight.w500,
  ),
  'textFieldFilled-counterTextStyle': 'textFieldFilled-helperTextStyle',
  'textFieldFilled-enabledBorder': const BorderSide(
    color: CustomTaavTheme.borderColor,
    width: 1,
  ),
  'textFieldFilled-focusedBorder': const BorderSide(
    color: CustomTaavTheme.borderColor,
    width: 2,
  ),
  'textFieldFilled-errorBorder': const BorderSide(
    color: CustomTaavTheme.dangerColor,
    width: 1,
  ),
  'textFieldFilled-focusedErrorBorder': const BorderSide(
    color: CustomTaavTheme.dangerColor,
    width: 2,
  ),
  'textFieldFilled-prefixTextStyle': (final style) => TextStyle(
        fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
        fontWeight: FontWeight.bold,
        color: CustomTaavTheme.textColor,
      ),
})
  ..inject(searchTextStyle)
  ..inject(descriptionTextStyle);

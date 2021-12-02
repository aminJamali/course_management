import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

import 'styles/button_style.dart';
import 'styles/checkbox_style.dart';
import 'styles/chip_style.dart';
import 'styles/dialog_style.dart';
import 'styles/divider_style.dart';
import 'styles/dropdown_style.dart';
import 'styles/icon_button_style.dart';
import 'styles/scaffold_style.dart';
import 'styles/text_form_field_style.dart';
import 'styles/text_style.dart';

class CustomTaavTheme {
  bool forDisableWarning() => true;
  static const MaterialColor primaryColor = MaterialColor(0xff4a4e69, {
    50: Color(0xFFe9eaed),
    100: Color(0xFFc9cad2),
    200: Color(0xffa5a7b4),
    300: Color(0xff808396),
    400: Color(0xff656980),
    500: Color(0xff4a4e69),
    600: Color(0xff434761),
    700: Color(0xff3a3d56),
    800: Color(0xff32354c),
    900: Color(0xff22253b),
  });
  static const Color infoColor = Color(0xffB4C6D6);
  static const Color secondaryColor = Color(0xff9A8C98);
  static const Color backgroundColor = Color(0xffF2E9E4);
  static const Color accentColor = Color(0xffF98A62);
  static const Color textColor = Color(0xFF22223B);
  static const Color liteTextColor = Color(0xFFF2E9E4);
  static const Color borderColor = Color(0xFF797d88);
  static const Color iconColor = Color(0xFFD1495B);
  static const Color successColor = Color(0xFF57B894);
  static const Color dangerColor = Color(0xFFD1495B);
  static const Color warningColor = Color(0xFFF98A62);
  static const Color disabledColor = Color(0xFFC6C2C2);

  static const String fontFamilyPrimary = 'IRANSans';
  static const String fontFamilySecondary = 'IRANSans';
  static String accentBorderButton = 'salaryButtonFilled';
  static String salaryLiteTextTheme = 'salaryLiteTextTheme';
  static String cancelBorderButton = 'salaryCancelButtonFilled';
  static String errorTextTheme = 'salaryErrorTextStyle';

  static String searchTextFormFiledThemeName = 'search-text-form-filed';

  static String descriptionTextFormFiledThemeName =
      'description-text-form-filed';

  static final defaultLightTheme = StyleData({})
    ..inject(TaavBaseTheme.toStyle(
      themeName: 'themeBase',
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      accentColor: accentColor,
      successColor: successColor,
      infoColor: infoColor,
      warningColor: warningColor,
      dangerColor: dangerColor,
      disabledColor: disabledColor,
      selectedColor: primaryColor,
      fontFamilyPrimary: fontFamilyPrimary,
      fontFamilySecondary: fontFamilySecondary,
      borderRadiusRectangle: TaavThemes.borderRadiusRectangle,
      borderRadiusRound: TaavThemes.borderRadiusRound,
      borderRadiusSemiRound: TaavThemes.borderRadiusSemiRound,
    ))
    ..inject(TaavTextStyleData.toStyle(
      themeName: salaryLiteTextTheme,
      fontFamily: 'themeBase-fontFamilyPrimary',
      fontSize: 'textCaption1-fontSize',
      fontWeight: 'textCaption1-fontWeight',
      textColor: liteTextColor,
    ))
    ..inject(textStyle)
    ..inject(buttonStyle)
    ..inject(iconButtonStyles)
    ..inject(textFormFieldStyle)
    ..inject(radioStyles)
    ..inject(checkBoxStyle)
    ..inject(dropdownStyle)
    ..inject(dividerStyle)
    ..inject(chipStyle)
    ..inject(badgeStyles)
    ..inject(dialogStyle)
    ..inject(scaffoldStyle)
    ..inject(switchStyles);
}

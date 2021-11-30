import 'package:taav_ui/src/components/taav_button/style/button_style_data.dart';
import 'package:taav_ui/src/components/taav_button/style/button_styles.dart';
import 'package:taav_ui/taav_ui.dart';

import '../custom_taav_theme.dart';

final buttonStyle = buttonStyles.copyWith({
  'buttonBase-textColor': CustomTaavTheme.accentColor,
  'buttonBase-iconColor': CustomTaavTheme.accentColor,
  'buttonFlat-textColor': const TaavStateColor(
    normalColor: CustomTaavTheme.accentColor,
    pressedColor: CustomTaavTheme.accentColor,
    disabledColor: TaavColors.black45,
  ),
  'buttonFlat-iconColor': const TaavStateColor(
    normalColor: CustomTaavTheme.accentColor,
    pressedColor: CustomTaavTheme.accentColor,
    disabledColor: TaavColors.black45,
  ),
  'buttonBase-shape': TaavWidgetShape.semiRound,
})
  ..inject(TaavButtonStyleData.toStyle(
    themeName: CustomTaavTheme.accentBorderButton,
    backgroundColor: const TaavStateColor(
      normalColor: 'themeBase-primaryColor',
      pressedColor: 'themeBase-primaryColor',
      disabledColor: 'themeBase-disabledColor',
    ),
    borderColor: const TaavStateColor(
        normalColor: 'themeBase-accentColor',
        pressedColor: 'themeBase-accentColor',
        disabledColor: 'themeBase-disabledColor'),
    borderWidth: 1.2,
    textColor: const TaavStateColor(
      normalColor: 'buttonBase-textColor',
      pressedColor: 'buttonBase-textColor',
      disabledColor: TaavColors.black45,
    ),
    iconColor: const TaavStateColor(
      normalColor: CustomTaavTheme.textColor,
      pressedColor: 'buttonBase-textColor',
      disabledColor: TaavColors.black45,
    ),
    shadowColor: TaavColors.grey,
    splashColor: null,
    elevation: 4.0,
  ))
  ..inject(TaavButtonStyleData.toStyle(
    themeName: CustomTaavTheme.cancelBorderButton,
    backgroundColor: const TaavStateColor(
      normalColor: 'themeBase-primaryColor',
      pressedColor: 'themeBase-primaryColor',
      disabledColor: 'themeBase-disabledColor',
    ),
    borderColor: const TaavStateColor(
        normalColor: CustomTaavTheme.iconColor,
        pressedColor: CustomTaavTheme.iconColor,
        disabledColor: CustomTaavTheme.iconColor),
    borderWidth: 1.2,
    textColor: const TaavStateColor(
      normalColor: CustomTaavTheme.iconColor,
      pressedColor: CustomTaavTheme.iconColor,
      disabledColor: CustomTaavTheme.iconColor,
    ),
    iconColor: const TaavStateColor(
      normalColor: CustomTaavTheme.iconColor,
      pressedColor: CustomTaavTheme.iconColor,
      disabledColor: CustomTaavTheme.iconColor,
    ),
    shadowColor: TaavColors.grey.withOpacity(0.1),
    splashColor: null,
    elevation: 4.0,
  ));

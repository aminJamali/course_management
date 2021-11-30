import 'package:taav_ui/taav_ui.dart';

import '../custom_taav_theme.dart';

final iconButtonStyles = iconButtonStyle.copyWith({
  'iconButtonFlat-iconColor': const TaavStateColor(
    normalColor: CustomTaavTheme.textColor,
    pressedColor: CustomTaavTheme.textColor,
    disabledColor: TaavColors.black45,
  ),
});

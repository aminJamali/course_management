import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

import '../custom_taav_theme.dart';

final dialogStyle = dialogStyles.copyWith({
  'dialog-shapeBorder': RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(TaavThemes.borderRadiusRectangle * 2),
  ),
  'dialog-bodyDecoration': const BoxDecoration(
    color: CustomTaavTheme.backgroundColor,
    borderRadius:
        BorderRadius.all(Radius.circular(TaavThemes.borderRadiusRectangle * 2)),
  ),
  'dialog-headerDecoration': const BoxDecoration(
    color: CustomTaavTheme.secondaryColor,
  ),
});

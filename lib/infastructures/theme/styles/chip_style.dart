import 'package:flutter/material.dart';
import 'package:taav_ui/src/components/taav_chip/style/chip_styles.dart';

import '../custom_taav_theme.dart';

final chipStyle = chipStyles.copyWith({
  'chip-backgroundColor': CustomTaavTheme.primaryColor,
  'chip-borderSide': const BorderSide(color: CustomTaavTheme.accentColor),
});

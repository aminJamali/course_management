import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

class SuccessDialog extends StatelessWidget {
  final String text;

  const SuccessDialog({required final this.text, final Key? key})
      : super(key: key);

  @override
  Widget build(final BuildContext context) => TaavDialogSimple(
        bodyMessage: text,
        status: TaavWidgetStatus.success,
        showCloseButton: false,
      );
}

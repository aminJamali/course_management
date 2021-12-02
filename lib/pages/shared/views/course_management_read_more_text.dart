import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

class CourseManagementTaavReadMoreText extends StatelessWidget {
  @required
  final String text;
  final String themeName;
  final bool toggleOnTextClick;
  final int trimLines;
  final TaavReadMoreShowMode showMode;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final String trimCollapsedText;

  const CourseManagementTaavReadMoreText(
      {required final this.text,
      final this.toggleOnTextClick = true,
      final this.trimLines = 1,
      final this.showMode = TaavReadMoreShowMode.popup,
      final this.trimCollapsedText = '',
      final Key? key,
      final this.textAlign = TextAlign.start,
      final this.textDirection,
      final this.themeName = 'textBody2'})
      : super(key: key);

  const CourseManagementTaavReadMoreText.heading6({
    required final this.text,
    final this.toggleOnTextClick = true,
    final this.trimLines = 1,
    final this.showMode = TaavReadMoreShowMode.popup,
    final this.trimCollapsedText = '',
    required final Key key,
    final this.textAlign = TextAlign.start,
    required final this.textDirection,
  })  : themeName = 'textHeading6',
        super(key: key);

  @override
  Widget build(final BuildContext context) => TaavReadMoreText(
        text,
        themeName: themeName,
        toggleOnTextClick: toggleOnTextClick,
        trimLines: trimLines,
        textAlign: textAlign,
        textDirection: textDirection ?? Directionality.of(context),
        showMode: TaavReadMoreShowMode.popup,
        trimCollapsedText: trimCollapsedText,
      );
}

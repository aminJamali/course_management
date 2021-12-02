import 'dart:math' as math;

import 'package:course_management/infastructures/theme/custom_taav_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final String? previousPageTitle;
  final List<Widget> actions;
  final void Function()? onBackButtonPress;

  const CustomAppBar(
      {final Key? key,
      final this.title,
      final this.previousPageTitle,
      final this.actions = const [],
      final this.onBackButtonPress})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  Widget build(final BuildContext context) => AppBar(
          actions: [
            ...actions,
            if (ModalRoute.of(context)!.canPop) _action else const SizedBox()
          ],
          title: title,
          automaticallyImplyLeading: false,
          backgroundColor: Get.theme.primaryColor,
          centerTitle: true,
          shape: _CustomShape(),
          leading: _leading(context));

  Widget get _action => TaavIconButton.flat(
      size: TaavWidgetSize.giant,
      icon: Icons.chevron_right,
      iconColor:
          const TaavStateColor(normalColor: CustomTaavTheme.liteTextColor),
      onTap: () {
        Get.back();
      });

  Widget _leading(final BuildContext context) => TaavIconButton.flat(
      size: TaavWidgetSize.giant,
      icon: Icons.menu,
      iconColor:
          const TaavStateColor(normalColor: CustomTaavTheme.liteTextColor),
      onTap: () {
        Scaffold.of(context).openDrawer();
      });
}

class _CustomShape extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(final Rect rect, {final TextDirection? textDirection}) {
    final halfHeight = rect.height * 3 / 4;
    final leftCenter = Rect.fromLTRB(rect.width - halfHeight,
        rect.height - halfHeight, rect.width, rect.height);

    return Path()
      ..lineTo(0, rect.height)
      ..lineTo(rect.width - halfHeight, rect.height)
      ..arcTo(leftCenter, math.pi / 2, -math.pi / 2, false)
      ..lineTo(rect.width, 0)
      ..close();
  }
}

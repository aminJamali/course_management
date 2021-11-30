import 'package:flutter/material.dart';
import 'package:course_management/pages/shared/views/custom_drawer.dart';
import 'package:taav_ui/taav_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaavScaffold(
      appBar: _buildAppbar(),
      drawer: CustomDrawer(),
      showBorder: false,
      padding: EdgeInsets.zero,
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const TaavText(
        'تغییر دانش آموز',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: TaavColors.white),
      ),
    );
  }
}

import 'package:course_management/course_management.dart';
import '../../../../../../generated/locales.g.dart';
import 'package:course_management/infastructures/theme/custom_taav_theme.dart';
import 'package:course_management/pages/course_list_page/controllers/get_course_list_controller.dart';
import 'package:course_management/pages/course_list_page/views/widgets/course_list.dart';
import 'package:course_management/pages/shared/views/custom_app_bar.dart';
import 'package:course_management/pages/shared/views/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class CourseListPage extends GetView<GetCourseListController> {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.rxPaginationList.key = GlobalKey();
    return TaavScaffold(
      showFooter: false,
      showBorder: false,
      contentPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      appBar: const CustomAppBar(
        title: TaavText.subtitle1(
          'دروس',
          style: TextStyle(color: CustomTaavTheme.liteTextColor),
        ),
      ),
      drawer: const CustomDrawer(),
      body: _body(context),
    );
  }

  Widget _body(final BuildContext context) => Column(
        children: [
          _searchRow(context),
          const Expanded(child: CourseList()),
        ],
      );

  Widget _searchRow(final BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Padding(
            padding: EdgeInsets.only(
                left: CourseManagementUtils.largePadding(),
                right: CourseManagementUtils.largePadding(),
                top: CourseManagementUtils.largePadding()),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _searchTextFormFiled),
                SizedBox(
                  width: CourseManagementUtils.mediumPadding(),
                ),
              ],
            )),
      );

  Widget get _searchTextFormFiled => TaavTextField(
        themeName: CustomTaavTheme.searchTextFormFiledThemeName,
        controller: controller.searchTextController,
        label: LocaleKeys.course_management_course_search_course_name.tr,
        prefixIcon: Icon(
          Icons.search,
          color: CourseManagementUtils.getBaseColorOfText(),
        ),
        onChanged: (final value) {
          controller.onSearchDebouncer(() {
            controller.onChangeSearchText();
          });
        },
        maxLines: 1,
        shape: TaavWidgetShape.semiRound,
        maxLength: 100,
      );
}

import 'package:course_management/pages/course_list_page/controllers/get_course_list_controller.dart';
import 'package:course_management/pages/course_list_page/models/course_list_item_view_model.dart';
import 'package:course_management/pages/course_list_page/views/widgets/course_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class CourseList extends GetView<GetCourseListController> {
  const CourseList({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Obx(() => _payrollListView);

  Widget get _payrollListView => TaavListView<CourseListItemViewModel>(
        key: controller.rxPaginationList.key,
        shrinkWrap: true,
        hasMoreData: controller.rxPaginationList.hasMoreData.value,
        emptyText: 'موردی برای نمایش وجود ندارد',
        retryMessage: 'تلاش دوباره',
        showError: controller.rxPaginationList.showError.value,
        onRefreshData: () => controller.getAllCourses(),
        onLoadMoreData: () => controller.getMoreCourse(),
        scrollDirection: Axis.vertical,
        items: controller.rxPaginationList.list,
        itemBuilder: (final context, final item, final index) =>
            _buildCardItems(item, index),
        padding: EdgeInsets.zero,
      );

  Widget _buildCardItems(final CourseListItemViewModel item, final int index) =>
      CourseListItem(item: item, index: index);
}

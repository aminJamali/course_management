import 'package:course_management/course_management.dart';
import 'package:course_management/pages/course_list_page/controllers/get_course_list_controller.dart';
import 'package:course_management/pages/course_list_page/models/course_list_item_view_model.dart';
import 'package:course_management/pages/shared/views/course_management_read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class CourseListItem extends GetView<GetCourseListController> {
  final CourseListItemViewModel item;
  final int index;
  const CourseListItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: const SlidableScrollActionPane(),
        actionExtentRatio: 0.20,
        closeOnScroll: true,
        actions: _slidableActions(context),
        child: Column(
          children: [
            ListTile(
              title: _courseTitle(),
              subtitle: _courseUnit(),
              trailing: const Icon(
                Icons.chevron_right,
                size: 30,
              ),
            ),
            const Divider(
              height: 10,
              color: TaavColors.black45,
            ),
          ],
        ),
      );

  List<Widget> _slidableActions(final BuildContext context) => <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => _onEditButton(context),
              icon: const Icon(
                Icons.edit,
                color: TaavColors.green,
              ),
            ),
          ],
        ),
      ];

  Future<void> _onEditButton(context) async {
    final editedViewModel = await Get.toNamed(
        '${CourseManagementRouteNames.editCoursePage}/${item.id}');
    if (editedViewModel != null) {
      controller.rxPaginationList.key.currentState![index] = editedViewModel;
    }
  }

  _courseTitle() => Padding(
        padding: EdgeInsets.all(CourseManagementUtils.mediumPadding()),
        child: CourseManagementTaavReadMoreText(
          text: item.title,
          textAlign: TextAlign.start,
        ),
      );

  _courseUnit() => Padding(
        padding: EdgeInsets.all(CourseManagementUtils.mediumPadding()),
        child: CourseManagementTaavReadMoreText(
          text: '${item.unit.toString()} واحد',
          textAlign: TextAlign.start,
        ),
      );
}

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
        actionExtentRatio: 0.30,
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
            IconButton(
              onPressed: () => _onButtonDelete(context),
              icon: const Icon(
                Icons.delete,
                color: TaavColors.red,
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

  _onButtonDelete(BuildContext context) async {
    final deletedViewModelId = await TaavDialog.showDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (
        final context,
        final anim1,
        final anim2,
      ) =>
          TaavDialogSimple(
        bodyTitle: 'حذف درس',
        bodyMessage: 'آیا از حذف اطمینان دارید؟',
        status: TaavWidgetStatus.danger,
        showCloseButton: false,
        onDoneTap: () => _deleteCourse(context),
        onCancelTap: Navigator.of(context).pop,
        doneText: 'بله',
        cancelText: 'خیر',
      ),
    );
    if (deletedViewModelId != null) {
      controller.rxPaginationList.key.currentState![index] = deletedViewModelId;
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

  _deleteCourse(BuildContext context) {
    final deletedItem = controller.deleteCourse(item.id);
    if (deletedItem != null) {
      controller.rxPaginationList.key.currentState!.removeItemAt(index);
    }
  }
}

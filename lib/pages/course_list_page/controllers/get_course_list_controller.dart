import 'package:course_management/infastructures/utils/rx_pagination_list.dart';
import 'package:course_management/pages/course_list_page/models/course_list_item_view_model.dart';
import 'package:course_management/pages/course_list_page/repositories/get_course_list_repository.dart';
import 'package:course_management/pages/shared/models/advanced_search_type.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:taav_ui/taav_ui.dart';

class GetCourseListController extends GetxController {
  GetCourseListRepository repository =
      GetCourseListRepository(onExceptionReport: (final exceptionKey) {
    TaavToastManager().showToast('business_exception_$exceptionKey'.tr);
  });

  RxPaginationList<CourseListItemViewModel> rxPaginationList =
      RxPaginationList(limit: 2);
  final Debouncer onSearchDebouncer =
      Debouncer(delay: const Duration(milliseconds: 700));
  RxBool searchMode = false.obs;
  TextEditingController searchTextController = TextEditingController();

  Future<void> getAllCourses() async {
    if (rxPaginationList.key != null &&
        rxPaginationList.key.currentState != null) {
      rxPaginationList.key.currentState!.clearAllItems();
    } else {
      rxPaginationList.list.clear();
    }
    rxPaginationList.paginationOffset = 1;
    rxPaginationList.hasMoreData.value = true;
    rxPaginationList.showError.value = false;
    final Either<String, List<CourseListItemViewModel>> result =
        await repository.getAllCourses(rxPaginationList.query);
    result.fold((final l) {
      rxPaginationList.showError.value = true;
    }, (final result) {
      if (result.length < rxPaginationList.limit) {
        rxPaginationList.hasMoreData.value = false;
      }

      if (rxPaginationList.key != null &&
          rxPaginationList.key.currentState != null) {
        rxPaginationList.key.currentState!.addAll(result);
      } else {
        rxPaginationList.list.addAll(result);
      }

      rxPaginationList.showError.value = false;
    });
  }

  Future<void> getMoreCourse() async {
    rxPaginationList.paginationOffset++;
    rxPaginationList.hasMoreData.value = true;
    rxPaginationList.showError.value = false;
    final Either<String, List<CourseListItemViewModel>> result =
        await repository.getAllCourses(rxPaginationList.query);
    result.fold((final l) {
      if (rxPaginationList.paginationOffset > 0) {
        rxPaginationList.paginationOffset--;
      }
      rxPaginationList.showError.value = true;
    }, (final result) {
      if (result.length < rxPaginationList.limit) {
        rxPaginationList.hasMoreData.value = false;
      }
      rxPaginationList.key.currentState!.addAll(result);
      rxPaginationList.showError.value = false;
    });
  }

  void _setSearchText() {
    if (rxPaginationList.filterHasKey('title')) {
      searchTextController.text = rxPaginationList.filterChipsList.first.text!;
    } else {
      searchTextController.text = '';
    }
  }

  void onChangeSearchText() {
    rxPaginationList.removeFilter('title');

    _addTitleToFilter();

    getAllCourses();
  }

  void _addTitleToFilter() {
    if (searchTextController.text.isNotEmpty) {
      rxPaginationList.addFilter(
          key: 'title',
          startValue: searchTextController.text,
          type: AdvancedSearchType.contains,
          text: searchTextController.text,
          show: false);
    }
  }

  void changeFilterChipList() {
    rxPaginationList.filterChipsList.clear();

    _setSearchText();

    getAllCourses();
  }

  @override
  void onInit() {
    getAllCourses();
    super.onInit();
  }
}

import 'package:course_management/course_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

import '../../pages/shared/models/advanced_search_type.dart';
import '../../pages/shared/models/advanced_search_view_model.dart';
import '../../pages/shared/models/database_mode.dart';

class RxPaginationList<T> {
  List<AdvancedSearchViewModel> filterChipsList = <AdvancedSearchViewModel>[];

  int paginationOffset = 0;
  RxBool hasMoreData = true.obs;
  RxBool showError = false.obs;

  List<T> list = <T>[];
  GlobalKey<TaavListViewState> key = GlobalKey<TaavListViewState>();
  int limit;
  RxPaginationList({final this.limit = 15}) {
    filterChipsList.add(AdvancedSearchViewModel(
      type: AdvancedSearchType.limit,
      key: 'limit',
      startValue: '$limit',
      show: false,
    ));
  }

  void removeFilter(final String key) {
    filterChipsList.removeWhere((final element) => element.key == key);
  }

  void removeFilters(final List<String> keys) {
    filterChipsList.removeWhere((final element) => keys.contains(element.key));
  }

  void addFilter(
      {final String? text,
      final AdvancedSearchType? type,
      final String? key,
      final String? startValue,
      final String? endValue,
      final bool show = true}) {
    final AdvancedSearchViewModel filterItem = AdvancedSearchViewModel(
        text: text,
        key: key,
        type: type,
        startValue: startValue,
        endValue: endValue,
        show: show);
    filterChipsList.add(filterItem);
  }

  bool filterHasKey(final String key) =>
      filterChipsList.indexWhere((final element) => element.key == 'title') !=
      -1;

  void onPageLoaded(final int totalItemsCount) {
    paginationOffset++;
    if (totalItemsCount == list.length) {
      hasMoreData.value = false;
    }
  }

  bool get isFirstPage => paginationOffset == 1;

  String get query {
    removeFilter('offset');
    removeFilter('limit');
    filterChipsList
      ..add(AdvancedSearchViewModel(
          type: AdvancedSearchType.offset,
          key: 'offset',
          startValue: paginationOffset.toString(),
          show: false))
      ..add(AdvancedSearchViewModel(
        type: AdvancedSearchType.limit,
        key: 'limit',
        startValue: '$limit',
        show: false,
      ));
    return CourseManagementUtils.generateQuery(
        filterChipsList, DatabaseMode.jsonServer);
  }
}

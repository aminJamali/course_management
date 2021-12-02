import 'package:course_management/infastructures/commons/repository_urls.dart';
import 'package:course_management/pages/course_list_page/models/course_list_item_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:taav_http_client/taav_http_client.dart';

class GetCourseListRepository {
  late TaavHttpClient taavHttpClient;
  final void Function(String exception) onExceptionReport;

  GetCourseListRepository({required final this.onExceptionReport}) {
    taavHttpClient =
        TaavHttpClient(handleExceptionCallBack: onExceptionReport, baseUrl: '');
  }

  Future<Either<String, List<CourseListItemViewModel>>> getAllCourses(
      final String query) async {
    final resultOrException =
        await taavHttpClient.get(RepositoryUrls.getcourseListUrl(query));

    return resultOrException
        .fold((final exceptionKey) => Left('business_exception_$exceptionKey'),
            (final data) {
      final items = (data as List)
          .map((e) => CourseListItemViewModel.fromJson(e))
          .toList();
      return Right(items);
    });
  }
}

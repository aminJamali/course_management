import 'package:course_management/infastructures/commons/repository_urls.dart';
import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:taav_http_client/taav_http_client.dart';

class EditDropDownRepository {
  late TaavHttpClient taavHttpClient;
  late final void Function(String exception) onExceptionReport;
  EditDropDownRepository({required final this.onExceptionReport}) {
    taavHttpClient =
        TaavHttpClient(handleExceptionCallBack: onExceptionReport, baseUrl: '');
  }

  Future<Either<String, dynamic>> getAllCourses() async {
    final resultOrException =
        await taavHttpClient.get(RepositoryUrls.courseUrl);
    return resultOrException.fold(
      (exceptionKey) => Left(exceptionKey),
      (data) {
        final items =
            (data as List).map((e) => CourseViewModel.fromJson(e)).toList();
        return Right(items);
      },
    );
  }
}

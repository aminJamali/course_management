import 'package:course_management/pages/add_course_page/models/add_course_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:taav_http_client/taav_http_client.dart';

import '../../../course_management.dart';

class EditCourseRepository {
  late TaavHttpClient taavHttpClient;
  late final void Function(String exception) onExceptionReport;
  EditCourseRepository({required final this.onExceptionReport}) {
    taavHttpClient =
        TaavHttpClient(handleExceptionCallBack: onExceptionReport, baseUrl: '');
  }

  Future<Either<String, dynamic>> editCourse(AddCourseDto dto) async {
    final resultOrException = await taavHttpClient
        .put(RepositoryUrls.editCourseUrl(dto.id), data: dto);
    return resultOrException.fold(
      (exception) => Left(exception),
      (result) => Right(
        result,
      ),
    );
  }

  Future<Either<String, CourseViewModel>> getCourseById(int id) async {
    final resultOrException =
        await taavHttpClient.get(RepositoryUrls.getCourseByIdUrl(id));
    return resultOrException.fold(
      (exception) => Left(exception),
      (result) => Right(
        CourseViewModel.fromJson(result),
      ),
    );
  }
}

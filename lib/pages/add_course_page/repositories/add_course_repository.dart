import 'package:dartz/dartz.dart';
import 'package:course_management/pages/add_course_page/models/add_course_dto.dart';
import 'package:taav_http_client/taav_http_client.dart';
import 'package:course_management/course_management.dart';

class AddCourseRepository {
  late TaavHttpClient taavHttpClient;
  late final void Function(String exception) onExceptionReport;
  AddCourseRepository({required final this.onExceptionReport}) {
    taavHttpClient =
        TaavHttpClient(handleExceptionCallBack: onExceptionReport, baseUrl: '');
  }
  Future<Either<String, dynamic>> add(final AddCourseDto dto) async {
    final resultOrException =
        await taavHttpClient.post(RepositoryUrls.addCourseUrl, data: dto);
    return resultOrException.fold(
        (exception) => Left(exception), (result) => Right(result));
  }
}

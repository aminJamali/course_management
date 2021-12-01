import 'package:course_management/pages/add_student_page.dart/models/add_student_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:taav_http_client/taav_http_client.dart';
import 'package:course_management/course_management.dart';

class AddStudentRepository {
  late TaavHttpClient taavHttpClient;
  late final void Function(String exception) onExceptionReport;
  AddStudentRepository({required final this.onExceptionReport}) {
    taavHttpClient =
        TaavHttpClient(handleExceptionCallBack: onExceptionReport, baseUrl: '');
  }
  Future<Either<String, dynamic>> addStudent(AddStudentDto dto) async {
    final resultOrException =
        await taavHttpClient.post(RepositoryUrls.addStudentUrl, data: dto);
    return resultOrException.fold(
        (exception) => Left(exception), (result) => Right(result));
  }
}

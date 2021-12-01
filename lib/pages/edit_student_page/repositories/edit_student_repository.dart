import 'package:course_management/infastructures/commons/repository_urls.dart';
import 'package:course_management/pages/edit_student_page/models/edit_student_dto.dart';
import 'package:course_management/pages/edit_student_page/models/student_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:taav_http_client/taav_http_client.dart';

class EditStudentRepository {
  late TaavHttpClient taavHttpClient;
  late final void Function(String exception) onExceptionReport;
  EditStudentRepository({required final this.onExceptionReport}) {
    taavHttpClient =
        TaavHttpClient(handleExceptionCallBack: onExceptionReport, baseUrl: '');
  }
  Future<Either<String, dynamic>> editStudent(EditStudentDto dto) async {
    final resultOrException = await taavHttpClient
        .put(RepositoryUrls.editStudentUrl(dto.id), data: dto);
    return resultOrException.fold(
        (exception) => Left(exception), (result) => Right(result));
  }

  Future<Either<String, StudentViewModel>> getStudentById(int id) async {
    final resultOrException =
        await taavHttpClient.get(RepositoryUrls.getStudentByIdUrl(id));
    return resultOrException.fold(
      (exception) => Left(exception),
      (result) => Right(
        StudentViewModel.fromJson(result),
      ),
    );
  }
}

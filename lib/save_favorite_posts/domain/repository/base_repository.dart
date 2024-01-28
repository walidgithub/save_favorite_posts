import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../reposnses/test_response.dart';
import '../requests/test_request.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<TestResponse>>> test();
  Future<Either<Failure, List<TestResponse>>> testWithParameter(List<TestRequest> test);
}
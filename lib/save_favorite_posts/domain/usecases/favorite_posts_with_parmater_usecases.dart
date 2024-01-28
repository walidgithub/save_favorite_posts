import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../repository/base_repository.dart';
import '../reposnses/test_response.dart';
import 'base_usecase/base_usecase.dart';

class GetTestUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  GetTestUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<TestResponse>>> call(parameters) async {
    return await baseRepository.testWithParameter(parameters);
  }
}
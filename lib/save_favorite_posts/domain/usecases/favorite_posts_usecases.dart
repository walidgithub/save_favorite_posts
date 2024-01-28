import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../repository/base_repository.dart';
import '../reposnses/test_response.dart';
import 'base_usecase/base_usecase.dart';

class GetPostsUseCase extends BaseUsecase<List<TestResponse>, NoParameters> {
  final BaseRepository baseRepository;

  GetPostsUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<TestResponse>>> call(NoParameters parameters) async {
    return await baseRepository.test();
  }
}
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../../reposnses/posts_response.dart';
import '../base_usecase/base_usecase.dart';

class GetPostByIdUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  GetPostByIdUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<PostsResponse>>> call(parameters) async {
    return await baseRepository.getPostById(parameters);
  }
}
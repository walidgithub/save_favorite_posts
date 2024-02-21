import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../../reposnses/posts_response.dart';
import '../base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetPostsByCategoryUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  GetPostsByCategoryUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<PostsResponse>>> call(parameters) async {
    return await baseRepository.getPostsByCategory(parameters);
  }
}
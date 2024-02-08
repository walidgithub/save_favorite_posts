import '../repository/base_repository.dart';
import 'base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../reposnses/posts_response.dart';

class GetPostsByCategoryNWebsiteUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  GetPostsByCategoryNWebsiteUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<PostsReponse>>> call(parameters) async {
    return await baseRepository.getPostsByCategoryNWebsite(parameters);
  }
}
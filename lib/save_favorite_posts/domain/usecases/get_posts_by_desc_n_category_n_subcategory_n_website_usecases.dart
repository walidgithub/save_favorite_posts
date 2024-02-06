import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../repository/base_repository.dart';
import '../reposnses/favorite_posts_response.dart';
import 'base_usecase/base_usecase.dart';

class GetPostsByDescNCategoryNSubCategoryNWebsiteUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  GetPostsByDescNCategoryNSubCategoryNWebsiteUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<PostsReponse>>> call(parameters) async {
    return await baseRepository.getPostsByDescNCategoryNSubCategoryNWebsite(parameters);
  }
}
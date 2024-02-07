import '../repository/base_repository.dart';
import 'base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../reposnses/favorite_posts_response.dart';

class GetPostsByCategoryNSubCategoryUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  GetPostsByCategoryNSubCategoryUseCase(this.baseRepository);


  @override
  Future<Either<Failure, List<PostsReponse>>> call(parameters) async {
    return await baseRepository.getPostsByDescNCategoryNSubCategoryNWebsite(parameters);
  }
}
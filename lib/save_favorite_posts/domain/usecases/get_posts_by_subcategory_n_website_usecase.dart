import '../repository/base_repository.dart';
import 'base_usecase/base_usecase.dart';

import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../reposnses/posts_response.dart';

class GetPostsBySubCategoryNWebsiteUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  GetPostsBySubCategoryNWebsiteUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<PostsReponse>>> call(parameters) async {
    return await baseRepository.getPostsBySubCategoryNWebsite(parameters);
  }
}
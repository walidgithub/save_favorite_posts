import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../reposnses/posts_response.dart';
import '../../repository/base_repository.dart';
import '../base_usecase/base_usecase.dart';

class GetPostsByCategoryNSubCategoryNWebsiteUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  GetPostsByCategoryNSubCategoryNWebsiteUseCase(this.baseRepository);


  @override
  Future<Either<Failure, List<PostsResponse>>> call(parameters) async {
    return await baseRepository.getPostsByCategoryNSubCategoryNWebsite(parameters);
  }
}
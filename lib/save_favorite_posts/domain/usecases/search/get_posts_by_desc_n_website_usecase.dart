import '../../repository/base_repository.dart';
import '../base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../reposnses/posts_response.dart';

class GetPostsByDescNWebsiteUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  GetPostsByDescNWebsiteUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<PostsResponse>>> call(parameters) async {
    return await baseRepository.getPostsByDescNWebsite(parameters);
  }
}
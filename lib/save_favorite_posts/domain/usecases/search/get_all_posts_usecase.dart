import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../../reposnses/posts_response.dart';
import '../base_usecase/base_usecase.dart';

class GetAllPostsUseCase extends BaseUsecase<List<PostsResponse>, NoParameters> {
  final BaseRepository baseRepository;

  GetAllPostsUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<PostsResponse>>> call(NoParameters parameters) async {
    return await baseRepository.getAllPosts();
  }
}
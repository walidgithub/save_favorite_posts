import 'package:dartz/dartz.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';
import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../../reposnses/posts_response.dart';
import '../base_usecase/base_usecase.dart';

class GetAllCategoriesUseCase extends BaseUsecase<List<FilterResponse>, NoParameters> {
  final BaseRepository baseRepository;

  GetAllCategoriesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<FilterResponse>>> call(NoParameters parameters) async {
    return await baseRepository.getAllCategories();
  }
}
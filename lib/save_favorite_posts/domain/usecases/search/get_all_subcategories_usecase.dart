import 'package:dartz/dartz.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/sub_category_response.dart';
import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../base_usecase/base_usecase.dart';

class GetAllSubCategoriesUseCase extends BaseUsecase<List<SubCategoryResponse>, NoParameters> {
  final BaseRepository baseRepository;

  GetAllSubCategoriesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<SubCategoryResponse>>> call(NoParameters parameters) async {
    return await baseRepository.getAllSubCategories();
  }
}
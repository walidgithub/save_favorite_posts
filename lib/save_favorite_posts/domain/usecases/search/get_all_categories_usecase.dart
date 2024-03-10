import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../../reposnses/category_response.dart';
import '../base_usecase/base_usecase.dart';

class GetAllCategoriesUseCase extends BaseUsecase<List<CategoryResponse>, NoParameters> {
  final BaseRepository baseRepository;

  GetAllCategoriesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<CategoryResponse>>> call(NoParameters parameters) async {
    return await baseRepository.getAllCategories();
  }
}
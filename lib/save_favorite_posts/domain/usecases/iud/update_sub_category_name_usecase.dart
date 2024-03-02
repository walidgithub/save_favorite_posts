import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../base_usecase/base_usecase.dart';

class UpdateSubCategoryNameUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  UpdateSubCategoryNameUseCase(this.baseRepository);

  @override
  Future<Either<Failure, int>> call(parameters) async {
    return await baseRepository.updateSubCategoryName(parameters);
  }
}
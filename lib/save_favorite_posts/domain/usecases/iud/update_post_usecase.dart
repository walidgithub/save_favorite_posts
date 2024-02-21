import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../base_usecase/base_usecase.dart';

class UpdatePostUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  UpdatePostUseCase(this.baseRepository);

  @override
  Future<Either<Failure, int>> call(parameters) async {
    return await baseRepository.updatePostData(parameters);
  }
}
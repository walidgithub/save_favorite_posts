import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../base_usecase/base_usecase.dart';

class ToggleSeenPostUseCase extends BaseUsecase {
  final BaseRepository baseRepository;

  ToggleSeenPostUseCase(this.baseRepository);

  @override
  Future<Either<Failure, int>> call(parameters) async {
    return await baseRepository.toggleSeenPost(parameters);
  }
}
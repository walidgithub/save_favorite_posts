import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../repository/base_repository.dart';
import '../../reposnses/website_response.dart';
import '../base_usecase/base_usecase.dart';

class GetAllWebsitesUseCase extends BaseUsecase<List<WebsiteResponse>, NoParameters> {
  final BaseRepository baseRepository;

  GetAllWebsitesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<WebsiteResponse>>> call(NoParameters parameters) async {
    return await baseRepository.getAllWebsites();
  }
}
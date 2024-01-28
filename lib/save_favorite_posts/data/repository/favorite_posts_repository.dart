import 'package:dartz/dartz.dart';
import '../../../core/error/error_handler.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/network_info.dart';
import '../../domain/repository/base_repository.dart';
import '../../domain/reposnses/test_response.dart';
import '../../domain/requests/test_request.dart';
import '../datasource/favorite_posts_remote_datasource.dart';

class TestRepository extends BaseRepository {
  final BaseRemoteDataSource _baseRemoteDataSource;
  final NetworkInfo _networkInfo;

  TestRepository(
      this._baseRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<TestResponse>>> test() async{
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.test();
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<TestResponse>>> testWithParameter(List<TestRequest> test) async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.testWithParameter(test);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}
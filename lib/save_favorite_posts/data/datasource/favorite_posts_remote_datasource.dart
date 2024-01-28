import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_manager.dart';
import '../../domain/requests/test_request.dart';
import '../models/favorite_posts_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<TestResponseModel>> test();
  Future<List<TestResponseModel>> testWithParameter(List<TestRequest> testRequest);
}

class FavoritePostsRemoteDataSource extends BaseRemoteDataSource {
  final DioManager _dio;
  FavoritePostsRemoteDataSource(this._dio);

  @override
  Future<List<TestResponseModel>> test() async {
    List<TestResponseModel> res = <TestResponseModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return TestResponseModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<TestResponseModel>> testWithParameter(List<TestRequest> testRequest) async {
    List<TestResponseModel> res = <TestResponseModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return TestResponseModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }
}

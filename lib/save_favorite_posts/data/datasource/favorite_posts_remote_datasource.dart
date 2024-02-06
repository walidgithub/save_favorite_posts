import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_manager.dart';
import '../../domain/requests/posts_by_category_n_subcategory_n_website_request.dart';
import '../../domain/requests/posts_by_category_n_subcategory_request.dart';
import '../../domain/requests/posts_by_category_n_website_request.dart';
import '../../domain/requests/posts_by_category_request.dart';
import '../../domain/requests/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import '../../domain/requests/posts_by_desc_n_category_n_subcategory_request.dart';
import '../../domain/requests/posts_by_desc_n_category_n_website_request.dart';
import '../../domain/requests/posts_by_desc_n_category_request.dart';
import '../../domain/requests/posts_by_desc_n_subcategory_n_website_request.dart';
import '../../domain/requests/posts_by_desc_n_subcategory_request.dart';
import '../../domain/requests/posts_by_desc_n_website_request.dart';
import '../../domain/requests/posts_by_desc_request.dart';
import '../../domain/requests/posts_by_subcategory_n_website_request.dart';
import '../../domain/requests/posts_by_subcategory_request.dart';
import '../../domain/requests/posts_by_website_request.dart';
import '../models/favorite_posts_model.dart';

abstract class BaseRemoteDataSource {
  // get all data ----------------------------------------
  Future<List<FavoritePostsModel>> getAllPosts();

  // search with all fields ----------------------------------------
  Future<List<FavoritePostsModel>> getPostsByDescNCategoryNSubCategoryNWebsite(PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest);

  // search with three fields -------------------------------------
  Future<List<FavoritePostsModel>> getPostsByDescNCategoryNSubCategory(PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest);
  Future<List<FavoritePostsModel>> getPostsByDescNWebsiteNCategory(PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest);
  Future<List<FavoritePostsModel>> getPostsByDescNWebsiteNSubCategory(PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest);
  Future<List<FavoritePostsModel>> getPostsByCategoryNSubCategoryNWebsite(PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest);

  // search with two fields ----------------------------------------
  Future<List<FavoritePostsModel>> getPostsByDescNCategory(PostsByDescNCategoryRequest postsByDescNCategoryRequest);
  Future<List<FavoritePostsModel>> getPostsByDescNSubCategory(PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest);
  Future<List<FavoritePostsModel>> getPostsByDescNWebsite(PostsByDesNWebsiteRequest postsByDesNWebsiteRequest);
  Future<List<FavoritePostsModel>> getPostsByCategoryNSubCategory(PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest);
  Future<List<FavoritePostsModel>> getPostsByCategoryNWebsite(PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest);
  Future<List<FavoritePostsModel>> getPostsBySubCategoryNWebsite(PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest);

  // search with one field ----------------------------------------
  Future<List<FavoritePostsModel>> getPostsByDesc(PostsByDescRequest postsByDescRequest);
  Future<List<FavoritePostsModel>> getPostsByWebsite(PostsByWebsiteRequest postsByWebsiteRequest);
  Future<List<FavoritePostsModel>> getPostsByCategory(PostsByCategoryRequest postsByCategoryRequest);
  Future<List<FavoritePostsModel>> getPostsBySubCategory(PostsBySubCategoryRequest postsBySubCategoryRequest);
}

class PostsRemoteDataSource extends BaseRemoteDataSource {
  final DioManager _dio;
  PostsRemoteDataSource(this._dio);

  @override
  Future<List<FavoritePostsModel>> getAllPosts() async {
    // TODO: implement getAllPosts
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByCategory(PostsByCategoryRequest postsByCategoryRequest) async {
    // TODO: implement getPostsByCategory
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByCategoryNSubCategory(PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest) async {
    // TODO: implement getPostsByCategoryNSubCategory
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByCategoryNSubCategoryNWebsite(PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByCategoryNSubCategoryNWebsite
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByCategoryNWebsite(PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByCategoryNWebsite
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByDesc(PostsByDescRequest postsByDescRequest) async {
    // TODO: implement getPostsByDesc
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByDescNCategory(PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    // TODO: implement getPostsByDescNCategory
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByDescNCategoryNSubCategory(PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest) async {
    // TODO: implement getPostsByDescNCategoryNSubCategory
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByDescNCategoryNSubCategoryNWebsite(PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByDescNCategoryNSubCategoryNWebsite
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByDescNSubCategory(PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    // TODO: implement getPostsByDescNSubCategory
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByDescNWebsite(PostsByDesNWebsiteRequest postsByDesNWebsiteRequest) async {
    // TODO: implement getPostsByDescNWebsite
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByDescNWebsiteNCategory(PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByDescNWebsiteNCategory
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByDescNWebsiteNSubCategory(PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByDescNWebsiteNSubCategory
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsBySubCategory(PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    // TODO: implement getPostsBySubCategory
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsBySubCategoryNWebsite(PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest) async {
    // TODO: implement getPostsBySubCategoryNWebsite
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FavoritePostsModel>> getPostsByWebsite(PostsByWebsiteRequest postsByWebsiteRequest) async {
    // TODO: implement getPostsByWebsite
    List<FavoritePostsModel> res = <FavoritePostsModel>[];
    try {
      return await _dio.get(ApiConstants.test).then((response) {
        res = (response.data['result'] as List).map((e) {
          return FavoritePostsModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  
}

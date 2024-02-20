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
import '../models/posts_model.dart';

abstract class BaseLocalDataSource {
  // get all data ----------------------------------------
  Future<List<PostsModel>> getAllPosts();

  // search with all fields ----------------------------------------
  Future<List<PostsModel>> getPostsByDescNCategoryNSubCategoryNWebsite(
      PostsByDescNCategoryNSubCategoryNWebsiteRequest
          postsByDescNCategoryNSubCategoryNWebsiteRequest);

  // search with three fields -------------------------------------
  Future<List<PostsModel>> getPostsByDescNCategoryNSubCategory(
      PostsByDescNCategoryNSubCategoryRequest
          postsByDescNCategoryNSubCategoryRequest);
  Future<List<PostsModel>> getPostsByDescNWebsiteNCategory(
      PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest);
  Future<List<PostsModel>> getPostsByDescNWebsiteNSubCategory(
      PostsByDescNSubCategoryNWebsiteRequest
          postsByDescNSubCategoryNWebsiteRequest);
  Future<List<PostsModel>> getPostsByCategoryNSubCategoryNWebsite(
      PostsByCategoryNSubCategoryNWebsiteRequest
          postsByCategoryNSubCategoryNWebsiteRequest);

  // search with two fields ----------------------------------------
  Future<List<PostsModel>> getPostsByDescNCategory(
      PostsByDescNCategoryRequest postsByDescNCategoryRequest);
  Future<List<PostsModel>> getPostsByDescNSubCategory(
      PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest);
  Future<List<PostsModel>> getPostsByDescNWebsite(
      PostsByDescNWebsiteRequest postsByDesNWebsiteRequest);
  Future<List<PostsModel>> getPostsByCategoryNSubCategory(
      PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest);
  Future<List<PostsModel>> getPostsByCategoryNWebsite(
      PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest);
  Future<List<PostsModel>> getPostsBySubCategoryNWebsite(
      PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest);

  // search with one field ----------------------------------------
  Future<List<PostsModel>> getPostsByDesc(
      PostsByDescRequest postsByDescRequest);
  Future<List<PostsModel>> getPostsByWebsite(
      PostsByWebsiteRequest postsByWebsiteRequest);
  Future<List<PostsModel>> getPostsByCategory(
      PostsByCategoryRequest postsByCategoryRequest);
  Future<List<PostsModel>> getPostsBySubCategory(
      PostsBySubCategoryRequest postsBySubCategoryRequest);
}

class PostsLocalDataSource extends BaseLocalDataSource {
  @override
  Future<List<PostsModel>> getAllPosts() async {
    List<PostsModel> res = <PostsModel>[];
    var result = postsModel.toList();
    try {
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByCategory(
      PostsByCategoryRequest postsByCategoryRequest) async {
    List<PostsModel> res = <PostsModel>[];
    var result = postsModel
        .where((element) => element.category == postsByCategoryRequest.category)
        .toList();
    try {
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByCategoryNSubCategory(
      PostsByCategoryNSubCategoryRequest
          postsByCategoryNSubCategoryRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByCategoryNSubCategoryNWebsite(
      PostsByCategoryNSubCategoryNWebsiteRequest
          postsByCategoryNSubCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByCategoryNSubCategoryNWebsite
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByCategoryNWebsite(
      PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDesc(
      PostsByDescRequest postsByDescRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNCategory(
      PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    List<PostsModel> res = <PostsModel>[];
    var result = postsModel
        .where((element) =>
            element.category == postsByDescNCategoryRequest.category &&
            element.description == 'using LinkedIn with Flutter with Designs')
        .toList();
    try {
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNCategoryNSubCategory(
      PostsByDescNCategoryNSubCategoryRequest
          postsByDescNCategoryNSubCategoryRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNCategoryNSubCategoryNWebsite(
      PostsByDescNCategoryNSubCategoryNWebsiteRequest
          postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNSubCategory(
      PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNWebsite(
      PostsByDescNWebsiteRequest postsByDesNWebsiteRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNWebsiteNCategory(
      PostsByDescNCategoryNWebsiteRequest
          postsByDescNCategoryNWebsiteRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNWebsiteNSubCategory(
      PostsByDescNSubCategoryNWebsiteRequest
          postsByDescNSubCategoryNWebsiteRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsBySubCategory(
      PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsBySubCategoryNWebsite(
      PostsBySubCategoryNWebsiteRequest
          postsBySubCategoryNWebsiteRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByWebsite(
      PostsByWebsiteRequest postsByWebsiteRequest) async {
    List<PostsModel> res = <PostsModel>[];
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }
}

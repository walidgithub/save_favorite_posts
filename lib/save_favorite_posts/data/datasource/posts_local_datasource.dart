import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/delete_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/insert_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/update_post_request.dart';

import '../../../core/local_db/dbHelper.dart';
import '../../domain/requests/iud/toggle_seen_post_request.dart';
import '../../domain/requests/iud/update_category_name_request.dart';
import '../../domain/requests/iud/update_sub_category_name_request.dart';
import '../../domain/requests/iud/update_website_name_request.dart';
import '../../domain/requests/search/get_post_by_id_request.dart';
import '../../domain/requests/search/posts_by_category_n_subcategory_n_website_request.dart';
import '../../domain/requests/search/posts_by_category_n_subcategory_request.dart';
import '../../domain/requests/search/posts_by_category_n_website_request.dart';
import '../../domain/requests/search/posts_by_category_request.dart';
import '../../domain/requests/search/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import '../../domain/requests/search/posts_by_desc_n_category_n_subcategory_request.dart';
import '../../domain/requests/search/posts_by_desc_n_category_n_website_request.dart';
import '../../domain/requests/search/posts_by_desc_n_category_request.dart';
import '../../domain/requests/search/posts_by_desc_n_subcategory_n_website_request.dart';
import '../../domain/requests/search/posts_by_desc_n_subcategory_request.dart';
import '../../domain/requests/search/posts_by_desc_n_website_request.dart';
import '../../domain/requests/search/posts_by_desc_request.dart';
import '../../domain/requests/search/posts_by_subcategory_n_website_request.dart';
import '../../domain/requests/search/posts_by_subcategory_request.dart';
import '../../domain/requests/search/posts_by_website_request.dart';
import '../models/category_model.dart';
import '../models/posts_model.dart';
import '../models/sub_category_model.dart';
import '../models/website_model.dart';

abstract class BaseLocalDataSource {
  // IUD -----------------------------
  Future<int> insertPostData(InsertPostRequest insertPostRequest);
  Future<int> deletePostData(DeletePostRequest deletePostRequest);
  Future<int> updatePostData(UpdatePostRequest updatePostRequest);
  Future<int> toggleSeenPost(ToggleSeenPostRequest toggleSeenPostRequest);
  Future<int> updateWebsiteName(UpdateWebsiteNameRequest updateWebsiteNameRequest);
  Future<int> updateCategoryName(UpdateCategoryNameRequest updateCategoryNameRequest);
  Future<int> updateSubCategoryName(UpdateSubCategoryNameRequest updateSubCategoryNameRequest);

  // get websites and categories and subcategories ----------------------------------------
  Future<List<CategoryModel>> getAllCategories();
  Future<List<SubCategoryModel>> getAllSubCategories();
  Future<List<WebsiteModel>> getAllWebsites();

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

  // get post by Id
  Future<List<PostsModel>> getPostById(
      GetPostByIdRequest getPostByIdRequest);
}

class PostsLocalDataSource extends BaseLocalDataSource {
  final DbHelper _dbHelper;

  PostsLocalDataSource(this._dbHelper) {
    _dbHelper.database;
  }

  @override
  Future<int> insertPostData(InsertPostRequest insertPostRequest) async {
    final res = await _dbHelper.insertPostData(insertPostRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<int> deletePostData(DeletePostRequest deletePostRequest) async {
    final res = await _dbHelper.deletePostData(deletePostRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<int> updatePostData(UpdatePostRequest updatePostRequest) async {
    final res = await _dbHelper.updatePostData(updatePostRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<int> updateCategoryName(UpdateCategoryNameRequest updateCategoryNameRequest) async {
    final res = await _dbHelper.updateCategoryName(updateCategoryNameRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<int> updateSubCategoryName(UpdateSubCategoryNameRequest updateSubCategoryNameRequest) async {
    final res = await _dbHelper.updateSubCategoryName(updateSubCategoryNameRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<int> updateWebsiteName(UpdateWebsiteNameRequest updateWebsiteNameRequest) async {
    final res = await _dbHelper.updateWebsiteName(updateWebsiteNameRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<int> toggleSeenPost(ToggleSeenPostRequest toggleSeenPostRequest) async {
    final res = await _dbHelper.toggleSeenPost(toggleSeenPostRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getAllPosts() async {
    final res = await _dbHelper.getAllSavedPosts();
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByCategory(
      PostsByCategoryRequest postsByCategoryRequest) async {
    final res = await _dbHelper.getSavedPostsByCategory(postsByCategoryRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByCategoryNSubCategory(
      PostsByCategoryNSubCategoryRequest
          postsByCategoryNSubCategoryRequest) async {
    final res = await _dbHelper.getSavedPostsByCategoryAndSubCategory(postsByCategoryNSubCategoryRequest);
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
    final res = await _dbHelper.getSavedPostsByCategoryAndSubCategoryAndWebsite(postsByCategoryNSubCategoryNWebsiteRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByCategoryNWebsite(
      PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    final res = await _dbHelper.getSavedPostsByCategoryAndWebsite(postsByCategoryNWebsiteRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDesc(
      PostsByDescRequest postsByDescRequest) async {
    final res = await _dbHelper.getSavedPostsByDesc(postsByDescRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNCategory(
      PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    final res = await _dbHelper.getSavedPostsByDescAndCategory(postsByDescNCategoryRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNCategoryNSubCategory(
      PostsByDescNCategoryNSubCategoryRequest
          postsByDescNCategoryNSubCategoryRequest) async {
    final res = await _dbHelper.getSavedPostsByDescAndCategoryAndSubCategory(postsByDescNCategoryNSubCategoryRequest);
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
    final res = await _dbHelper.getSavedPostsByDescAndCategoryAndSubCategoryAndWebsite(postsByDescNCategoryNSubCategoryNWebsiteRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNSubCategory(
      PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    final res = await _dbHelper.getSavedPostsByDescAndSubCategory(postsByDescNSubCategoryRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByDescNWebsite(
      PostsByDescNWebsiteRequest postsByDescNWebsiteRequest) async {
    final res = await _dbHelper.getSavedPostsByDescAndWebsite(postsByDescNWebsiteRequest);
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
    final res = await _dbHelper.getSavedPostsByDescAndWebsiteAndCategory(postsByDescNCategoryNWebsiteRequest);
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
    final res = await _dbHelper.getSavedPostsByDescAndWebsiteAndSubCategory(postsByDescNSubCategoryNWebsiteRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsBySubCategory(
      PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    final res = await _dbHelper.getSavedPostsBySubCategory(postsBySubCategoryRequest);
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
    final res = await _dbHelper.getSavedPostsBySubCategoryAndWebsite(postsBySubCategoryNWebsiteRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostsByWebsite(
      PostsByWebsiteRequest postsByWebsiteRequest) async {
    final res = await _dbHelper.getSavedPostsByWebsite(postsByWebsiteRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final res = await _dbHelper.getAllCategories();
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<SubCategoryModel>> getAllSubCategories() async {
    final res = await _dbHelper.getAllSubCategories();
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<WebsiteModel>> getAllWebsites() async {
    final res = await _dbHelper.getAllWebSites();
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<PostsModel>> getPostById(GetPostByIdRequest getPostByIdRequest) async {
    final res = await _dbHelper.getSavedPostById(getPostByIdRequest);
    try {
      return res;
    } catch (e) {
      throw e.toString();
    }
  }
}

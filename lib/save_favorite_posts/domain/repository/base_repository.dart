import 'package:dartz/dartz.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/sub_category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/website_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/delete_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/insert_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/update_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/search/get_post_by_id_request.dart';
import '../../../core/error/failure.dart';
import '../reposnses/posts_response.dart';
import '../requests/search/posts_by_category_n_subcategory_n_website_request.dart';
import '../requests/search/posts_by_category_n_subcategory_request.dart';
import '../requests/search/posts_by_category_n_website_request.dart';
import '../requests/search/posts_by_category_request.dart';
import '../requests/search/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import '../requests/search/posts_by_desc_n_category_n_subcategory_request.dart';
import '../requests/search/posts_by_desc_n_category_n_website_request.dart';
import '../requests/search/posts_by_desc_n_category_request.dart';
import '../requests/search/posts_by_desc_n_subcategory_n_website_request.dart';
import '../requests/search/posts_by_desc_n_subcategory_request.dart';
import '../requests/search/posts_by_desc_n_website_request.dart';
import '../requests/search/posts_by_desc_request.dart';
import '../requests/search/posts_by_subcategory_n_website_request.dart';
import '../requests/search/posts_by_subcategory_request.dart';
import '../requests/search/posts_by_website_request.dart';

abstract class BaseRepository {
  // IUD ----------------------------------------
  Future<Either<Failure, int>> insertPostData(InsertPostRequest insertPostRequest);
  Future<Either<Failure, int>> deletePostData(DeletePostRequest deletePostRequest);
  Future<Either<Failure, int>> updatePostData(UpdatePostRequest updatePostRequest);

  // get websites and categories and subcategories
  Future<Either<Failure, List<CategoryResponse>>> getAllCategories();
  Future<Either<Failure, List<SubCategoryResponse>>> getAllSubCategories();
  Future<Either<Failure, List<WebsiteResponse>>> getAllWebsites();

  // get all data ----------------------------------------
  Future<Either<Failure, List<PostsResponse>>> getAllPosts();

  // search with all fields ----------------------------------------
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNCategoryNSubCategoryNWebsite(PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest);
  
  // search with three fields -------------------------------------
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNCategoryNSubCategory(PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNWebsiteNCategory(PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNWebsiteNSubCategory(PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsByCategoryNSubCategoryNWebsite(PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest);
  
  // search with two fields ----------------------------------------
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNCategory(PostsByDescNCategoryRequest postsByDescNCategoryRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNSubCategory(PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNWebsite(PostsByDescNWebsiteRequest postsByDesNWebsiteRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsByCategoryNSubCategory(PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsByCategoryNWebsite(PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsBySubCategoryNWebsite(PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest);
  
  // search with one field ----------------------------------------
  Future<Either<Failure, List<PostsResponse>>> getPostsByDesc(PostsByDescRequest postsByDescRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsByWebsite(PostsByWebsiteRequest postsByWebsiteRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsByCategory(PostsByCategoryRequest postsByCategoryRequest);
  Future<Either<Failure, List<PostsResponse>>> getPostsBySubCategory(PostsBySubCategoryRequest postsBySubCategoryRequest);

  // get post by id
  Future<Either<Failure, List<PostsResponse>>> getPostById(GetPostByIdRequest getPostByIdRequest);
}
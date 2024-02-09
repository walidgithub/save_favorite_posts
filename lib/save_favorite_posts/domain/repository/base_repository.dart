import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../reposnses/posts_response.dart';
import '../requests/posts_by_category_n_subcategory_n_website_request.dart';
import '../requests/posts_by_category_n_subcategory_request.dart';
import '../requests/posts_by_category_n_website_request.dart';
import '../requests/posts_by_category_request.dart';
import '../requests/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import '../requests/posts_by_desc_n_category_n_subcategory_request.dart';
import '../requests/posts_by_desc_n_category_n_website_request.dart';
import '../requests/posts_by_desc_n_category_request.dart';
import '../requests/posts_by_desc_n_subcategory_n_website_request.dart';
import '../requests/posts_by_desc_n_subcategory_request.dart';
import '../requests/posts_by_desc_n_website_request.dart';
import '../requests/posts_by_desc_request.dart';
import '../requests/posts_by_subcategory_n_website_request.dart';
import '../requests/posts_by_subcategory_request.dart';
import '../requests/posts_by_website_request.dart';

abstract class BaseRepository {
  // get all data ----------------------------------------
  Future<Either<Failure, List<PostsReponse>>> getAllPosts();

  // search with all fields ----------------------------------------
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategoryNSubCategoryNWebsite(PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest);
  
  // search with three fields -------------------------------------
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategoryNSubCategory(PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsiteNCategory(PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsiteNSubCategory(PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNSubCategoryNWebsite(PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest);
  
  // search with two fields ----------------------------------------
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategory(PostsByDescNCategoryRequest postsByDescNCategoryRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNSubCategory(PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsite(PostsByDescNWebsiteRequest postsByDesNWebsiteRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNSubCategory(PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNWebsite(PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsBySubCategoryNWebsite(PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest);
  
  // search with one field ----------------------------------------
  Future<Either<Failure, List<PostsReponse>>> getPostsByDesc(PostsByDescRequest postsByDescRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsByWebsite(PostsByWebsiteRequest postsByWebsiteRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategory(PostsByCategoryRequest postsByCategoryRequest);
  Future<Either<Failure, List<PostsReponse>>> getPostsBySubCategory(PostsBySubCategoryRequest postsBySubCategoryRequest);
}
import 'package:dartz/dartz.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/sub_category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/website_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/delete_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/insert_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/update_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/search/posts_by_category_n_subcategory_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/search/posts_by_category_n_website_request.dart';
import '../../../core/error/error_handler.dart';
import '../../../core/error/failure.dart';
import '../../domain/repository/base_repository.dart';
import '../../domain/reposnses/posts_response.dart';
import '../../domain/requests/search/posts_by_category_n_subcategory_request.dart';
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
import '../datasource/posts_local_datasource.dart';

class PostsRepository extends BaseRepository {
  final BaseLocalDataSource _baseLocalDataSource;

  PostsRepository(
    this._baseLocalDataSource,
  );

  @override
  Future<Either<Failure, List<PostsResponse>>> getAllPosts() async {
    try {
      final result = await _baseLocalDataSource.getAllPosts();
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsByCategory(
      PostsByCategoryRequest postsByCategoryRequest) async {
    try {
      final result =
          await _baseLocalDataSource.getPostsByCategory(postsByCategoryRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsByCategoryNSubCategory(
      PostsByCategoryNSubCategoryRequest
          postsByCategoryNSubCategoryRequest) async {
    try {
      final result = await _baseLocalDataSource
          .getPostsByCategoryNSubCategory(postsByCategoryNSubCategoryRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>>
      getPostsByCategoryNSubCategoryNWebsite(
          PostsByCategoryNSubCategoryNWebsiteRequest
              postsByCategoryNSubCategoryNWebsiteRequest) async {
    try {
      final result =
          await _baseLocalDataSource.getPostsByCategoryNSubCategoryNWebsite(
              postsByCategoryNSubCategoryNWebsiteRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsByCategoryNWebsite(
      PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    try {
      final result = await _baseLocalDataSource
          .getPostsByCategoryNWebsite(postsByCategoryNWebsiteRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsByDesc(
      PostsByDescRequest postsByDescRequest) async {
    try {
      final result =
          await _baseLocalDataSource.getPostsByDesc(postsByDescRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNCategory(
      PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    try {
      final result = await _baseLocalDataSource
          .getPostsByDescNCategory(postsByDescNCategoryRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>>
      getPostsByDescNCategoryNSubCategory(
          PostsByDescNCategoryNSubCategoryRequest
              postsByDescNCategoryNSubCategoryRequest) async {
    try {
      final result =
          await _baseLocalDataSource.getPostsByDescNCategoryNSubCategory(
              postsByDescNCategoryNSubCategoryRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>>
      getPostsByDescNCategoryNSubCategoryNWebsite(
          PostsByDescNCategoryNSubCategoryNWebsiteRequest
              postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    try {
      final result = await _baseLocalDataSource
          .getPostsByDescNCategoryNSubCategoryNWebsite(
              postsByDescNCategoryNSubCategoryNWebsiteRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNSubCategory(
      PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    try {
      final result = await _baseLocalDataSource
          .getPostsByDescNSubCategory(postsByDescNSubCategoryRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNWebsite(
      PostsByDescNWebsiteRequest postsByDesNWebsiteRequest) async {
    try {
      final result = await _baseLocalDataSource
          .getPostsByDescNWebsite(postsByDesNWebsiteRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsByDescNWebsiteNCategory(
      PostsByDescNCategoryNWebsiteRequest
          postsByDescNCategoryNWebsiteRequest) async {
    try {
      final result = await _baseLocalDataSource
          .getPostsByDescNWebsiteNCategory(postsByDescNCategoryNWebsiteRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>>
      getPostsByDescNWebsiteNSubCategory(
          PostsByDescNSubCategoryNWebsiteRequest
              postsByDescNSubCategoryNWebsiteRequest) async {
    try {
      final result =
          await _baseLocalDataSource.getPostsByDescNWebsiteNSubCategory(
              postsByDescNSubCategoryNWebsiteRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsBySubCategory(
      PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    try {
      final result = await _baseLocalDataSource
          .getPostsBySubCategory(postsBySubCategoryRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsBySubCategoryNWebsite(
      PostsBySubCategoryNWebsiteRequest
          postsBySubCategoryNWebsiteRequest) async {
    try {
      final result = await _baseLocalDataSource
          .getPostsBySubCategoryNWebsite(postsBySubCategoryNWebsiteRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsResponse>>> getPostsByWebsite(
      PostsByWebsiteRequest postsByWebsiteRequest) async {
    try {
      final result =
          await _baseLocalDataSource.getPostsByWebsite(postsByWebsiteRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, int>> deletePostData(DeletePostRequest deletePostRequest) async {
    try {
      final result =
      await _baseLocalDataSource.deletePostData(deletePostRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, int>> insertPostData(InsertPostRequest insertPostRequest) async {
    try {
      final result =
      await _baseLocalDataSource.insertPostData(insertPostRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, int>> updatePostData(UpdatePostRequest updatePostRequest) async {
    try {
      final result =
      await _baseLocalDataSource.updatePostData(updatePostRequest);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<CategoryResponse>>> getAllCategories() async {
    try {
      final result =
      await _baseLocalDataSource.getAllCategories();
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<SubCategoryResponse>>> getAllSubCategories() async {
    try {
      final result =
      await _baseLocalDataSource.getAllSubCategories();
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<WebsiteResponse>>> getAllWebsites() async {
    try {
      final result =
      await _baseLocalDataSource.getAllWebsites();
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}

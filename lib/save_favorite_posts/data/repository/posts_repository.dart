import 'package:dartz/dartz.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_category_n_subcategory_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_category_n_subcategory_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_category_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_category_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_category_n_subcategory_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_category_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_category_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_subcategory_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_subcategory_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_subcategory_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_subcategory_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_website_request.dart';
import '../../../core/error/error_handler.dart';
import '../../../core/error/failure.dart';
import '../../domain/repository/base_repository.dart';
import '../../domain/reposnses/posts_response.dart';
import '../../domain/requests/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import '../datasource/posts_local_datasource.dart';

class PostsRepository extends BaseRepository {
  final BaseLocalDataSource _baseLocalDataSource;

  PostsRepository(
    this._baseLocalDataSource,
  );

  @override
  Future<Either<Failure, List<PostsReponse>>> getAllPosts() async {
    try {
      final remoteTest = await _baseLocalDataSource.getAllPosts();
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategory(
      PostsByCategoryRequest postsByCategoryRequest) async {
    try {
      final remoteTest =
          await _baseLocalDataSource.getPostsByCategory(postsByCategoryRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNSubCategory(
      PostsByCategoryNSubCategoryRequest
          postsByCategoryNSubCategoryRequest) async {
    try {
      final remoteTest = await _baseLocalDataSource
          .getPostsByCategoryNSubCategory(postsByCategoryNSubCategoryRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>>
      getPostsByCategoryNSubCategoryNWebsite(
          PostsByCategoryNSubCategoryNWebsiteRequest
              postsByCategoryNSubCategoryNWebsiteRequest) async {
    try {
      final remoteTest =
          await _baseLocalDataSource.getPostsByCategoryNSubCategoryNWebsite(
              postsByCategoryNSubCategoryNWebsiteRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNWebsite(
      PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    try {
      final remoteTest = await _baseLocalDataSource
          .getPostsByCategoryNWebsite(postsByCategoryNWebsiteRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDesc(
      PostsByDescRequest postsByDescRequest) async {
    try {
      final remoteTest =
          await _baseLocalDataSource.getPostsByDesc(postsByDescRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategory(
      PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    try {
      final remoteTest = await _baseLocalDataSource
          .getPostsByDescNCategory(postsByDescNCategoryRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>>
      getPostsByDescNCategoryNSubCategory(
          PostsByDescNCategoryNSubCategoryRequest
              postsByDescNCategoryNSubCategoryRequest) async {
    try {
      final remoteTest =
          await _baseLocalDataSource.getPostsByDescNCategoryNSubCategory(
              postsByDescNCategoryNSubCategoryRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>>
      getPostsByDescNCategoryNSubCategoryNWebsite(
          PostsByDescNCategoryNSubCategoryNWebsiteRequest
              postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    try {
      final remoteTest = await _baseLocalDataSource
          .getPostsByDescNCategoryNSubCategoryNWebsite(
              postsByDescNCategoryNSubCategoryNWebsiteRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNSubCategory(
      PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    try {
      final remoteTest = await _baseLocalDataSource
          .getPostsByDescNSubCategory(postsByDescNSubCategoryRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsite(
      PostsByDescNWebsiteRequest postsByDesNWebsiteRequest) async {
    try {
      final remoteTest = await _baseLocalDataSource
          .getPostsByDescNWebsite(postsByDesNWebsiteRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsiteNCategory(
      PostsByDescNCategoryNWebsiteRequest
          postsByDescNCategoryNWebsiteRequest) async {
    try {
      final remoteTest = await _baseLocalDataSource
          .getPostsByDescNWebsiteNCategory(postsByDescNCategoryNWebsiteRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>>
      getPostsByDescNWebsiteNSubCategory(
          PostsByDescNSubCategoryNWebsiteRequest
              postsByDescNSubCategoryNWebsiteRequest) async {
    try {
      final remoteTest =
          await _baseLocalDataSource.getPostsByDescNWebsiteNSubCategory(
              postsByDescNSubCategoryNWebsiteRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsBySubCategory(
      PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    try {
      final remoteTest = await _baseLocalDataSource
          .getPostsBySubCategory(postsBySubCategoryRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsBySubCategoryNWebsite(
      PostsBySubCategoryNWebsiteRequest
          postsBySubCategoryNWebsiteRequest) async {
    try {
      final remoteTest = await _baseLocalDataSource
          .getPostsBySubCategoryNWebsite(postsBySubCategoryNWebsiteRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByWebsite(
      PostsByWebsiteRequest postsByWebsiteRequest) async {
    try {
      final remoteTest =
          await _baseLocalDataSource.getPostsByWebsite(postsByWebsiteRequest);
      return Right(remoteTest);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}

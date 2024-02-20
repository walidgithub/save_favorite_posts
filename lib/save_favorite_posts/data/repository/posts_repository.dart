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
import '../datasource/posts_remote_datasource.dart';

class PostsRepository extends BaseRepository {
  final BaseRemoteDataSource _baseRemoteDataSource;

  PostsRepository(
      this._baseRemoteDataSource,);

  @override
  Future<Either<Failure, List<PostsReponse>>> getAllPosts() async {

      try {
        final remoteTest = await _baseRemoteDataSource.getAllPosts();
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategory(PostsByCategoryRequest postsByCategoryRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByCategory(postsByCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNSubCategory(PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByCategoryNSubCategory(postsByCategoryNSubCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNSubCategoryNWebsite(PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByCategoryNSubCategoryNWebsite(postsByCategoryNSubCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNWebsite(PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByCategoryNWebsite(postsByCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDesc(PostsByDescRequest postsByDescRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDesc(postsByDescRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategory(PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNCategory(postsByDescNCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategoryNSubCategory(PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNCategoryNSubCategory(postsByDescNCategoryNSubCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategoryNSubCategoryNWebsite(PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNCategoryNSubCategoryNWebsite(postsByDescNCategoryNSubCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNSubCategory(PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNSubCategory(postsByDescNSubCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsite(PostsByDescNWebsiteRequest postsByDesNWebsiteRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNWebsite(postsByDesNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsiteNCategory(PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNWebsiteNCategory(postsByDescNCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsiteNSubCategory(PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNWebsiteNSubCategory(postsByDescNSubCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsBySubCategory(PostsBySubCategoryRequest postsBySubCategoryRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsBySubCategory(postsBySubCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsBySubCategoryNWebsite(PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsBySubCategoryNWebsite(postsBySubCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByWebsite(PostsByWebsiteRequest postsByWebsiteRequest) async {

      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByWebsite(postsByWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

  }

}
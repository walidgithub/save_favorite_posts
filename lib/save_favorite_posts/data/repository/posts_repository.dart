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
import '../../../core/network/network_info.dart';
import '../../domain/repository/base_repository.dart';
import '../../domain/reposnses/posts_response.dart';
import '../../domain/requests/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import '../datasource/posts_remote_datasource.dart';

class PostsRepository extends BaseRepository {
  final BaseRemoteDataSource _baseRemoteDataSource;
  final NetworkInfo _networkInfo;

  PostsRepository(
      this._baseRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<PostsReponse>>> getAllPosts() async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getAllPosts();
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategory(PostsByCategoryRequest postsByCategoryRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByCategory(postsByCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNSubCategory(PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByCategoryNSubCategory(postsByCategoryNSubCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNSubCategoryNWebsite(PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByCategoryNSubCategoryNWebsite
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByCategoryNSubCategoryNWebsite(postsByCategoryNSubCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByCategoryNWebsite(PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByCategoryNWebsite
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByCategoryNWebsite(postsByCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDesc(PostsByDescRequest postsByDescRequest) async {
    // TODO: implement getPostsByDesc
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDesc(postsByDescRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategory(PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    // TODO: implement getPostsByDescNCategory
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNCategory(postsByDescNCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategoryNSubCategory(PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest) async {
    // TODO: implement getPostsByDescNCategoryNSubCategory
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNCategoryNSubCategory(postsByDescNCategoryNSubCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNCategoryNSubCategoryNWebsite(PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByDescNCategoryNSubCategoryNWebsite
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNCategoryNSubCategoryNWebsite(postsByDescNCategoryNSubCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNSubCategory(PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    // TODO: implement getPostsByDescNSubCategory
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNSubCategory(postsByDescNSubCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsite(PostsByDescNWebsiteRequest postsByDesNWebsiteRequest) async {
    // TODO: implement getPostsByDescNWebsite
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNWebsite(postsByDesNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsiteNCategory(PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByDescNWebsiteNCategory
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNWebsiteNCategory(postsByDescNCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByDescNWebsiteNSubCategory(PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest) async {
    // TODO: implement getPostsByDescNWebsiteNSubCategory
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByDescNWebsiteNSubCategory(postsByDescNSubCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsBySubCategory(PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    // TODO: implement getPostsBySubCategory
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsBySubCategory(postsBySubCategoryRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsBySubCategoryNWebsite(PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest) async {
    // TODO: implement getPostsBySubCategoryNWebsite
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsBySubCategoryNWebsite(postsBySubCategoryNWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsReponse>>> getPostsByWebsite(PostsByWebsiteRequest postsByWebsiteRequest) async {
    // TODO: implement getPostsByWebsite
    if (await _networkInfo.isConnected) {
      try {
        final remoteTest = await _baseRemoteDataSource.getPostsByWebsite(postsByWebsiteRequest);
        return Right(remoteTest);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}
import 'package:path/path.dart';
import 'package:save_favorite_posts/save_favorite_posts/data/models/website_model.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/delete_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/insert_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/update_post_request.dart';
import 'package:sqflite/sqflite.dart';
import '../../save_favorite_posts/data/models/category_model.dart';
import '../../save_favorite_posts/data/models/posts_model.dart';
import '../../save_favorite_posts/data/models/sub_category_model.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_category_n_subcategory_n_website_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_category_n_subcategory_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_category_n_website_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_category_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_desc_n_category_n_subcategory_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_desc_n_category_n_website_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_desc_n_category_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_desc_n_subcategory_n_website_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_desc_n_subcategory_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_desc_n_website_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_desc_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_subcategory_n_website_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_subcategory_request.dart';
import '../../save_favorite_posts/domain/requests/search/posts_by_website_request.dart';class DbHelper {
  Database? _db;

  String dbdName = 'saved_posts_test.db';

  static int? insertedNewPostId;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDB(dbdName);
      return _db!;
    }
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  Future createDB(Database db, int version) async {
    await db.execute(
        'create table saved_posts(postId integer primary key autoincrement, website varchar(15), postLink varchar(255), category varchar(15), subCategory varchar(15), description varchar(15), seen integer)');
  }

  // Saved Posts Operations----------------------------------------------------------------------------------------
  // add new post ------------------------------------------
  Future<int> insertPostData(InsertPostRequest insertPostRequest) async {
    final db = _db!.database;
    return  db.insert('saved_posts', insertPostRequest.toJson());
  }

  // update post ------------------------------------------
  Future<int> updatePostData(UpdatePostRequest updatePostRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;
    return db.update('saved_posts', updatePostRequest.toJson(),
        where: 'postId = ?', whereArgs: [updatePostRequest.id]);
  }
  
  // delete post ------------------------------------------
  Future<int> deletePostData(DeletePostRequest deletePostRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    return db.delete('saved_posts', where: 'postId = ?', whereArgs: [deletePostRequest.id]);
  }
  
  // get first post --------------------------
  Future<List<PostsModel>> getFirstSavedPost() async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts Order by postId ASC LIMIT 1');
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  
  // get next post --------------------------
  Future<List<PostsModel>> getNextSavedPost(int postId) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where postId > ? Order by postId ASC LIMIT 1',[postId]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  
  // get prev post --------------------------
  Future<List<PostsModel>> getPrevSavedPost(int postId) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where postId < ? Order by postId DESC LIMIT 1',[postId]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  
  // get last post --------------------------
  Future<List<PostsModel>> getLastSavedPost() async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where postId=(select max(postId) from saved_posts)');
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  // get all categories and subcategories and websites----------------------------------------
  Future<List<CategoryModel>> getAllCategories() async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT DISTINCT Category FROM saved_posts Order by postId ASC');
    return result.map((map) => CategoryModel.fromJson(map)).toList();
  }

  Future<List<SubCategoryModel>> getAllSubCategories() async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT DISTINCT SubCategory FROM saved_posts Order by postId ASC');
    return result.map((map) => SubCategoryModel.fromJson(map)).toList();
  }

  Future<List<WebsiteModel>> getAllWebSites() async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT DISTINCT Website FROM saved_posts Order by postId ASC');
    return result.map((map) => WebsiteModel.fromJson(map)).toList();
  }
  
  // get all data ----------------------------------------
  Future<List<PostsModel>> getAllSavedPosts() async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts Order by postId ASC');
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  // search with all fields ----------------------------------------
  Future<List<PostsModel>> getSavedPostsByDescAndCategoryAndSubCategoryAndWebsite(PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where description like ? and category = ? and subCategory = ? and website = ? Order by postId ASC',['%${postsByDescNCategoryNSubCategoryNWebsiteRequest.description}%',postsByDescNCategoryNSubCategoryNWebsiteRequest.category,postsByDescNCategoryNSubCategoryNWebsiteRequest.subCategory,postsByDescNCategoryNSubCategoryNWebsiteRequest.website]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  // search with three fields -------------------------------------
  Future<List<PostsModel>> getSavedPostsByDescAndCategoryAndSubCategory(PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where description like ? and category = ? and subCategory = ? Order by postId ASC',['%,${postsByDescNCategoryNSubCategoryRequest.description}%',postsByDescNCategoryNSubCategoryRequest.category,postsByDescNCategoryNSubCategoryRequest.subCategory]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByDescAndWebsiteAndCategory(PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where description like ? and category = ? and website = ? Order by postId ASC',['%,${postsByDescNCategoryNWebsiteRequest.description}%',postsByDescNCategoryNWebsiteRequest.category,postsByDescNCategoryNWebsiteRequest.website]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByDescAndWebsiteAndSubCategory(PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where description like ? and subCategory = ? and website = ? Order by postId ASC',['%,${postsByDescNSubCategoryNWebsiteRequest.description}%',postsByDescNSubCategoryNWebsiteRequest.subCategory,postsByDescNSubCategoryNWebsiteRequest.website]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByCategoryAndSubCategoryAndWebsite(PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where category = ? and subCategory = ? and website = ? Order by postId ASC',[postsByCategoryNSubCategoryNWebsiteRequest.category,postsByCategoryNSubCategoryNWebsiteRequest.subCategory,postsByCategoryNSubCategoryNWebsiteRequest.website]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  // search with two fields ----------------------------------------
  Future<List<PostsModel>> getSavedPostsByDescAndCategory(PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where description like ? and category = ? Order by postId ASC',['%,${postsByDescNCategoryRequest.description}%',postsByDescNCategoryRequest.category]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByDescAndSubCategory(PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where description like ? and subCategory = ? Order by postId ASC',['%,${postsByDescNSubCategoryRequest.description}%',postsByDescNSubCategoryRequest.subCategory]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByDescAndWebsite(PostsByDescNWebsiteRequest postsByDescNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where description like ? and website = ? Order by postId ASC',['%,${postsByDescNWebsiteRequest.description}%',postsByDescNWebsiteRequest.website]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByCategoryAndSubCategory(PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where category = ? and subCategory = ? Order by postId ASC',[postsByCategoryNSubCategoryRequest.category,postsByCategoryNSubCategoryRequest.subCategory]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByCategoryAndWebsite(PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where category = ? and website = ? Order by postId ASC',[postsByCategoryNWebsiteRequest.category,postsByCategoryNWebsiteRequest.website]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsBySubCategoryAndWebsite(PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where subCategory = ? and website = ? Order by postId ASC',[postsBySubCategoryNWebsiteRequest.subCategory,postsBySubCategoryNWebsiteRequest.website]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  // search with one field ----------------------------------------
  Future<List<PostsModel>> getSavedPostsByDesc(PostsByDescRequest postsByDescRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where description like ? Order by postId ASC',['%,${postsByDescRequest.description}%']);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  Future<List<PostsModel>> getSavedPostsByWebsite(PostsByWebsiteRequest postsByWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where website = ? Order by postId ASC',[postsByWebsiteRequest.website]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  Future<List<PostsModel>> getSavedPostsByCategory(PostsByCategoryRequest postsByCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where category = ? Order by postId ASC',[postsByCategoryRequest.category]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  Future<List<PostsModel>> getSavedPostsBySubCategory(PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where subCategory = ? Order by postId ASC',[postsBySubCategoryRequest.subCategory]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
}

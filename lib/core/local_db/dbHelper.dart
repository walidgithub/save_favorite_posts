import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:save_favorite_posts/save_favorite_posts/data/models/website_model.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/delete_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/insert_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/toggle_seen_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/update_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/update_website_name_request.dart';
import 'package:sqflite/sqflite.dart';
import '../../save_favorite_posts/data/models/category_model.dart';
import '../../save_favorite_posts/data/models/posts_model.dart';
import '../../save_favorite_posts/data/models/sub_category_model.dart';
import '../../save_favorite_posts/domain/requests/iud/update_category_name_request.dart';
import '../../save_favorite_posts/domain/requests/iud/update_sub_category_name_request.dart';
import '../../save_favorite_posts/domain/requests/search/get_all_posts_request.dart';
import '../../save_favorite_posts/domain/requests/search/get_post_by_id_request.dart';
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

  // update website name ------------------------------------------
  Future<int> updateWebsiteName(UpdateWebsiteNameRequest updateWebsiteNameRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;
    return db.update('saved_posts', updateWebsiteNameRequest.toJson(),
        where: 'website = ?', whereArgs: [updateWebsiteNameRequest.website]);
  }

  // update category name ------------------------------------------
  Future<int> updateCategoryName(UpdateCategoryNameRequest updateCategoryNameRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;
    return db.update('saved_posts', updateCategoryNameRequest.toJson(),
        where: 'category = ?', whereArgs: [updateCategoryNameRequest.category]);
  }

  // update subCategory name ------------------------------------------
  Future<int> updateSubCategoryName(UpdateSubCategoryNameRequest updateSubCategoryNameRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;
    return db.update('saved_posts', updateSubCategoryNameRequest.toJson(),
        where: 'subCategory = ?', whereArgs: [updateSubCategoryNameRequest.subCategory]);
  }

  // toggle seen post ------------------------------------------
  Future<int> toggleSeenPost(ToggleSeenPostRequest toggleSeenPostRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;
    return db.update('saved_posts', toggleSeenPostRequest.toJson(),
        where: 'postId = ?', whereArgs: [toggleSeenPostRequest.id]);
  }
  
  // delete post ------------------------------------------
  Future<int> deletePostData(DeletePostRequest deletePostRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    return db.delete('saved_posts', where: 'postId = ?', whereArgs: [deletePostRequest.id]);
  }

  // get all categories and subcategories and websites----------------------------------------
  Future<List<CategoryModel>> getAllCategories() async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT DISTINCT Category FROM saved_posts Order by postId ASC');
    return result.map((map) => CategoryModel.fromMap(map)).toList();
  }

  Future<List<SubCategoryModel>> getAllSubCategories() async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT DISTINCT SubCategory FROM saved_posts where subCategory != "All" Order by postId ASC');
    return result.map((map) => SubCategoryModel.fromMap(map)).toList();
  }

  Future<List<WebsiteModel>> getAllWebSites() async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT DISTINCT Website FROM saved_posts Order by postId ASC');
    return result.map((map) => WebsiteModel.fromMap(map)).toList();
  }
  
  // get all data ----------------------------------------
  Future<List<PostsModel>> getAllSavedPosts(GetAllPostsRequest getAllPostsRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;
    var result = [];
    if (getAllPostsRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts Order by postId ASC');
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where seen = ? Order by postId ASC',[getAllPostsRequest.seen]);
    }
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  // search with all fields ----------------------------------------
  Future<List<PostsModel>> getSavedPostsByDescAndCategoryAndSubCategoryAndWebsite(PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByDescNCategoryNSubCategoryNWebsiteRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and category = ? and subCategory = ? and website = ? Order by postId ASC',['%${postsByDescNCategoryNSubCategoryNWebsiteRequest.description}%',postsByDescNCategoryNSubCategoryNWebsiteRequest.category,postsByDescNCategoryNSubCategoryNWebsiteRequest.subCategory,postsByDescNCategoryNSubCategoryNWebsiteRequest.website]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and category = ? and subCategory = ? and website = ? and seen = ? Order by postId ASC',['%${postsByDescNCategoryNSubCategoryNWebsiteRequest.description}%',postsByDescNCategoryNSubCategoryNWebsiteRequest.category,postsByDescNCategoryNSubCategoryNWebsiteRequest.subCategory,postsByDescNCategoryNSubCategoryNWebsiteRequest.website,postsByDescNCategoryNSubCategoryNWebsiteRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  // search with three fields -------------------------------------
  Future<List<PostsModel>> getSavedPostsByDescAndCategoryAndSubCategory(PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByDescNCategoryNSubCategoryRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and category = ? and subCategory = ? Order by postId ASC',['%${postsByDescNCategoryNSubCategoryRequest.description}%',postsByDescNCategoryNSubCategoryRequest.category,postsByDescNCategoryNSubCategoryRequest.subCategory]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and category = ? and subCategory = ? and seen = ? Order by postId ASC',['%${postsByDescNCategoryNSubCategoryRequest.description}%',postsByDescNCategoryNSubCategoryRequest.category,postsByDescNCategoryNSubCategoryRequest.subCategory,postsByDescNCategoryNSubCategoryRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByDescAndWebsiteAndCategory(PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByDescNCategoryNWebsiteRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and category = ? and website = ? Order by postId ASC',['%${postsByDescNCategoryNWebsiteRequest.description}%',postsByDescNCategoryNWebsiteRequest.category,postsByDescNCategoryNWebsiteRequest.website]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and category = ? and website = ? and seen = ? Order by postId ASC',['%${postsByDescNCategoryNWebsiteRequest.description}%',postsByDescNCategoryNWebsiteRequest.category,postsByDescNCategoryNWebsiteRequest.website,postsByDescNCategoryNWebsiteRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByDescAndWebsiteAndSubCategory(PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByDescNSubCategoryNWebsiteRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and subCategory = ? and website = ? Order by postId ASC',['%${postsByDescNSubCategoryNWebsiteRequest.description}%',postsByDescNSubCategoryNWebsiteRequest.subCategory,postsByDescNSubCategoryNWebsiteRequest.website]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and subCategory = ? and website = ? and seen = ? Order by postId ASC',['%${postsByDescNSubCategoryNWebsiteRequest.description}%',postsByDescNSubCategoryNWebsiteRequest.subCategory,postsByDescNSubCategoryNWebsiteRequest.website,postsByDescNSubCategoryNWebsiteRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByCategoryAndSubCategoryAndWebsite(PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByCategoryNSubCategoryNWebsiteRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where category = ? and subCategory = ? and website = ? Order by postId ASC',[postsByCategoryNSubCategoryNWebsiteRequest.category,postsByCategoryNSubCategoryNWebsiteRequest.subCategory,postsByCategoryNSubCategoryNWebsiteRequest.website]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where category = ? and subCategory = ? and website = ? and seen = ? Order by postId ASC',[postsByCategoryNSubCategoryNWebsiteRequest.category,postsByCategoryNSubCategoryNWebsiteRequest.subCategory,postsByCategoryNSubCategoryNWebsiteRequest.website,postsByCategoryNSubCategoryNWebsiteRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  // search with two fields ----------------------------------------
  Future<List<PostsModel>> getSavedPostsByDescAndCategory(PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;
    var result = [];
    if (postsByDescNCategoryRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and category = ? Order by postId ASC',['%${postsByDescNCategoryRequest.description}%',postsByDescNCategoryRequest.category]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and category = ? and seen = ? Order by postId ASC',['%${postsByDescNCategoryRequest.description}%',postsByDescNCategoryRequest.category,postsByDescNCategoryRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByDescAndSubCategory(PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByDescNSubCategoryRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and subCategory = ? Order by postId ASC',['%${postsByDescNSubCategoryRequest.description}%',postsByDescNSubCategoryRequest.subCategory]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and subCategory = ? and seen = ? Order by postId ASC',['%${postsByDescNSubCategoryRequest.description}%',postsByDescNSubCategoryRequest.subCategory,postsByDescNSubCategoryRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByDescAndWebsite(PostsByDescNWebsiteRequest postsByDescNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByDescNWebsiteRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and website = ? Order by postId ASC',['%${postsByDescNWebsiteRequest.description}%',postsByDescNWebsiteRequest.website]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and website = ? and seen = ? Order by postId ASC',['%${postsByDescNWebsiteRequest.description}%',postsByDescNWebsiteRequest.website,postsByDescNWebsiteRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByCategoryAndSubCategory(PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByCategoryNSubCategoryRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where category = ? and subCategory = ? Order by postId ASC',[postsByCategoryNSubCategoryRequest.category,postsByCategoryNSubCategoryRequest.subCategory]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where category = ? and subCategory = ? and seen = ? Order by postId ASC',[postsByCategoryNSubCategoryRequest.category,postsByCategoryNSubCategoryRequest.subCategory,postsByCategoryNSubCategoryRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsByCategoryAndWebsite(PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByCategoryNWebsiteRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where category = ? and website = ? Order by postId ASC',[postsByCategoryNWebsiteRequest.category,postsByCategoryNWebsiteRequest.website]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where category = ? and website = ? and seen = ? Order by postId ASC',[postsByCategoryNWebsiteRequest.category,postsByCategoryNWebsiteRequest.website,postsByCategoryNWebsiteRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }
  Future<List<PostsModel>> getSavedPostsBySubCategoryAndWebsite(PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsBySubCategoryNWebsiteRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where subCategory = ? and website = ? Order by postId ASC',[postsBySubCategoryNWebsiteRequest.subCategory,postsBySubCategoryNWebsiteRequest.website]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where subCategory = ? and website = ? and seen = ? Order by postId ASC',[postsBySubCategoryNWebsiteRequest.subCategory,postsBySubCategoryNWebsiteRequest.website,postsBySubCategoryNWebsiteRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  // search with one field ----------------------------------------
  Future<List<PostsModel>> getSavedPostsByDesc(PostsByDescRequest postsByDescRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByDescRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? Order by postId ASC',['%${postsByDescRequest.description}%']);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where description like ? and seen = ? Order by postId ASC',['%${postsByDescRequest.description}%',postsByDescRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  Future<List<PostsModel>> getSavedPostsByWebsite(PostsByWebsiteRequest postsByWebsiteRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByWebsiteRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where website = ? Order by postId ASC',[postsByWebsiteRequest.website]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where website = ? and seen = ? Order by postId ASC',[postsByWebsiteRequest.website,postsByWebsiteRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  Future<List<PostsModel>> getSavedPostsByCategory(PostsByCategoryRequest postsByCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsByCategoryRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where category = ? Order by postId ASC',[postsByCategoryRequest.category]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where category = ? and seen = ? Order by postId ASC',[postsByCategoryRequest.category,postsByCategoryRequest.seen]);
    }

    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  Future<List<PostsModel>> getSavedPostsBySubCategory(PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    var result = [];
    if (postsBySubCategoryRequest.seen == 0) {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where subCategory = ? Order by postId ASC',[postsBySubCategoryRequest.subCategory]);
    } else {
      result = await db.rawQuery(
          'SELECT * FROM saved_posts where subCategory = ? and seen = ? Order by postId ASC',[postsBySubCategoryRequest.subCategory,postsBySubCategoryRequest.seen]);
    }
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  Future<List<PostsModel>> getSavedPostById(GetPostByIdRequest getPostByIdRequest) async {
    if (_db == null) {
      await initDB(dbdName);
    }

    final db = _db!.database;

    final result = await db.rawQuery(
        'SELECT * FROM saved_posts where postId = ?',[getPostByIdRequest.id]);
    return result.map((map) => PostsModel.fromJson(map)).toList();
  }

  // ------------------------------------------------------------------------------
  // edit package id and db name !!!!!
  getDBPath() async {
    String databasePath = await getDatabasesPath();
    print(databasePath);
    Directory? externalStoragePath = await getExternalStorageDirectory();
    print(externalStoragePath);
  }

  backupDB() async {
    var externalStorageStatus = await Permission.manageExternalStorage.status;
    if (!externalStorageStatus.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
    try {
      File ourDBFile = File('/data/user/0/com.saved_posts.saved_posts/databases/saved_posts_last.db');
      await ourDBFile.copy('/sdcard/Download/saved_posts_last.db');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  restoreDB() async {
    var externalStorageStatus = await Permission.manageExternalStorage.status;
    if (!externalStorageStatus.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }

    try {
      File savedDBFile = File('/sdcard/Download/saved_posts_last.db');
      await savedDBFile.copy('/data/user/0/com.saved_posts.saved_posts/databases/saved_posts_last.db');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  deleteDB() async {
    try {
      _db = null;
      deleteDatabase('/data/user/0/com.saved_posts.saved_posts/databases/saved_posts_last.db');
    } catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

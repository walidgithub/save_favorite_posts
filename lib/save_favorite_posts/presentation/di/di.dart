import 'package:get_it/get_it.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/iud/delete_post_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_all_categories_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_all_subcategories_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_all_websites_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/local_db/dbHelper.dart';
import '../../../core/preferences/app_pref.dart';
import '../../data/datasource/posts_local_datasource.dart';
import '../../data/repository/posts_repository.dart';
import '../../domain/repository/base_repository.dart';
import '../../domain/usecases/iud/insert_new_post_usecase.dart';
import '../../domain/usecases/iud/update_post_usecase.dart';
import '../../domain/usecases/search/get_all_posts_usecase.dart';
import '../../domain/usecases/search/get_posts_by_category_n_subcategory_n_website_usecase.dart';
import '../../domain/usecases/search/get_posts_by_category_n_subcategory_usecase.dart';
import '../../domain/usecases/search/get_posts_by_category_n_website_usecase.dart';
import '../../domain/usecases/search/get_posts_by_category_usecase.dart';
import '../../domain/usecases/search/get_posts_by_desc_n_category_n_subcategory_n_website_usecases.dart';
import '../../domain/usecases/search/get_posts_by_desc_n_category_n_subcategory_usecase.dart';
import '../../domain/usecases/search/get_posts_by_desc_n_category_n_website_usecase.dart';
import '../../domain/usecases/search/get_posts_by_desc_n_category_usecase.dart';
import '../../domain/usecases/search/get_posts_by_desc_n_subcategory_n_website_usecase.dart';
import '../../domain/usecases/search/get_posts_by_desc_n_subcategory_usecase.dart';
import '../../domain/usecases/search/get_posts_by_desc_n_website_usecase.dart';
import '../../domain/usecases/search/get_posts_by_desc_usecase.dart';
import '../../domain/usecases/search/get_posts_by_subcategory_n_website_usecase.dart';
import '../../domain/usecases/search/get_posts_by_subcategory_usecase.dart';
import '../../domain/usecases/search/get_posts_by_website_usecase.dart';
import '../ui/cubit/post/post_cubit.dart';
import '../ui/cubit/search/search_cubit.dart';
final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {

    // app prefs instance
    final sharedPrefs = await SharedPreferences.getInstance();

    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    // dbHelper
    sl.registerLazySingleton<DbHelper>(() => DbHelper());

    // Cubit
    sl.registerFactory(() => SearchCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));

    sl.registerFactory(() => PostCubit(sl(), sl(), sl(), sl(), sl(), sl()));

    // Use Cases
    sl.registerLazySingleton<GetAllCategoriesUseCase>(
            () => GetAllCategoriesUseCase(sl()));

    sl.registerLazySingleton<GetAllSubCategoriesUseCase>(
            () => GetAllSubCategoriesUseCase(sl()));

    sl.registerLazySingleton<GetAllWebsitesUseCase>(
            () => GetAllWebsitesUseCase(sl()));

    sl.registerLazySingleton<InsertPostUseCase>(
            () => InsertPostUseCase(sl()));

    sl.registerLazySingleton<UpdatePostUseCase>(
            () => UpdatePostUseCase(sl()));

    sl.registerLazySingleton<DeletePostUseCase>(
            () => DeletePostUseCase(sl()));

    sl.registerLazySingleton<GetAllPostsUseCase>(
            () => GetAllPostsUseCase(sl()));

    sl.registerLazySingleton<GetPostsByCategoryNSubCategoryNWebsiteUseCase>(
            () => GetPostsByCategoryNSubCategoryNWebsiteUseCase(sl()));

    sl.registerLazySingleton<GetPostsByCategoryNSubCategoryUseCase>(
            () => GetPostsByCategoryNSubCategoryUseCase(sl()));

    sl.registerLazySingleton<GetPostsByCategoryNWebsiteUseCase>(
            () => GetPostsByCategoryNWebsiteUseCase(sl()));

    sl.registerLazySingleton<GetPostsByCategoryUseCase>(
            () => GetPostsByCategoryUseCase(sl()));

    sl.registerLazySingleton<GetPostsByDescNCategoryNSubCategoryNWebsiteUseCase>(
            () => GetPostsByDescNCategoryNSubCategoryNWebsiteUseCase(sl()));

    sl.registerLazySingleton<GetPostsByDescNCategoryNSubCategoryUseCase>(
            () => GetPostsByDescNCategoryNSubCategoryUseCase(sl()));

    sl.registerLazySingleton<GetPostsByDescNCategoryNWebsiteUseCase>(
            () => GetPostsByDescNCategoryNWebsiteUseCase(sl()));

    sl.registerLazySingleton<GetPostsByDescNCategoryUseCase>(
            () => GetPostsByDescNCategoryUseCase(sl()));

    sl.registerLazySingleton<GetPostsByDescNSubCategoryNWebsiteUseCase>(
            () => GetPostsByDescNSubCategoryNWebsiteUseCase(sl()));

    sl.registerLazySingleton<GetPostsByDescNSubCategoryUseCase>(
            () => GetPostsByDescNSubCategoryUseCase(sl()));

    sl.registerLazySingleton<GetPostsByDescNWebsiteUseCase>(
            () => GetPostsByDescNWebsiteUseCase(sl()));

    sl.registerLazySingleton<GetPostsByDescUseCase>(
            () => GetPostsByDescUseCase(sl()));

    sl.registerLazySingleton<GetPostsBySubCategoryNWebsiteUseCase>(
            () => GetPostsBySubCategoryNWebsiteUseCase(sl()));

    sl.registerLazySingleton<GetPostsBySubCategoryUseCase>(
            () => GetPostsBySubCategoryUseCase(sl()));

    sl.registerLazySingleton<GetPostsByWebsiteUseCase>(
            () => GetPostsByWebsiteUseCase(sl()));


    // Repositories
    sl.registerLazySingleton<BaseRepository>(
            () => PostsRepository(sl()));

    // Local DataSource
    sl.registerLazySingleton<BaseLocalDataSource>(
            () => PostsLocalDataSource(sl()));

  }
}

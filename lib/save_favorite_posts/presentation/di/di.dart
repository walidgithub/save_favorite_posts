import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/network/network_info.dart';
import '../../../core/preferences/app_pref.dart';
import '../../data/datasource/favorite_posts_remote_datasource.dart';
import '../../data/repository/favorite_posts_repository.dart';
import '../../domain/repository/base_repository.dart';
import '../../domain/usecases/favorite_posts_usecases.dart';
final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {

    // app prefs instance
    final sharedPrefs = await SharedPreferences.getInstance();

    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    // Network Info
    sl.registerLazySingleton<NetworkInfo>(
            () => NetworkInfoImpl(InternetConnectionChecker()));

    // Bloc
    // sl.registerFactory(() => ChairBloc(sl(), sl(), sl()));

    // Use Cases
    sl.registerLazySingleton<GetTestUseCase>(
            () => GetTestUseCase(sl()));

    // Repositories
    sl.registerLazySingleton<BaseRepository>(
            () => TestRepository(sl(), sl()));

    // Remote DataSource
    sl.registerLazySingleton<BaseRemoteDataSource>(
            () => FavoritePostsRemoteDataSource(sl()));

  }
}

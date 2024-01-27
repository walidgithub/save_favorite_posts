
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {

    // app prefs instance
    final sharedPrefs = await SharedPreferences.getInstance();

    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    // Cubit
    // sl.registerFactory(() => HomeCubit(sl()));
    // sl.registerFactory(() => FavoriteCubit(sl()));
    // sl.registerFactory(() => FavoriteDetailCubit(sl()));
    // sl.registerFactory(() => PageNoteCubit(sl()));

    // Repo
    // sl.registerLazySingleton<QuranLocalRepositoryImp>(() => QuranLocalRepositoryImp(sl()));

  }
}

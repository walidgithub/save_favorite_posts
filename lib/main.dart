import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/di/di.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/router/app_router.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/home_view/home_view.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/language_manager.dart';

import 'core/preferences/app_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]
  );

  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS,
      child: Phoenix(child: const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  bool loggedIn = false;
  goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
      if (isUserLoggedIn)
        {loggedIn = true}
      else
        {loggedIn = false}
    });
  }

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    goNext();
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Save Favorite Posts',
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.homeRoute,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const HomeView(),
    );
  }
}

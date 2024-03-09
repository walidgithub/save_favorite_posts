import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/di/di.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/router/app_router.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/cubit/search/search_cubit.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/app_theme.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/language_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';

import 'core/preferences/app_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: SystemUiOverlay.values);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS,
      child: Phoenix(child: const MyApp())));

  ErrorWidget.builder = (FlutterErrorDetails details) =>
      Scaffold(
        body: SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  const Text(
                    AppStrings.someThingWentWrong,
                    style: TextStyle(color: ColorManager.kPrimary),
                  ),
                  SizedBox(
                    height: AppConstants.heightBetweenElements,
                  ),
                  Text(
                    details.exceptionAsString(),
                    style: const TextStyle(color: ColorManager.kPrimary),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  bool firstLoad = true;

  goNext() {
    _appPreferences.isFirstLoad().then((isFirstLoad) => {
      if (isFirstLoad) {firstLoad = false} else {firstLoad = true}
    });
  }

  @override
  void initState() {
    goNext();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: BlocProvider(
              create: (context) => sl<SearchCubit>(),
              child: MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                title: 'Posts',
                builder: EasyLoading.init(),
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: firstLoad ? Routes.onBoarding : Routes.landing,
                theme: AppTheme.lightTheme,
              ),
            ));
      },
    );
  }
}

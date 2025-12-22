import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/utils/app_route.dart';
import 'package:newsappnew/core/utils/app_themes.dart';
import 'package:newsappnew/core/utils/service_locator_getit.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_change_theme/cubit_change_theme.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_change_theme/state_change_theme.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/cubit_news_app.dart';
import 'package:newsappnew/feature/allm/cubites_manger/observer.dart';
import 'package:newsappnew/core/utils/dio_helper.dart';
import 'package:newsappnew/core/utils/shared_preferences.dart';
import 'package:newsappnew/feature/allm/domain/repos/repo_n_s_c_f_s_implement.dart';
import 'package:newsappnew/feature/business/presetation/manger/bussinus_cubit/cubit_bussinus_cubit.dart';
import 'package:newsappnew/feature/science/presetation/manger/cubit/science_cubit.dart';
import 'package:newsappnew/feature/sports/presetation/sports_cubit/sports_cubit.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.initi();
  setupServiceLocatorGetit();

  await SPreferences.initialSPreferences();
  bool? dark = SPreferences.getData(key: 'dark');
  runApp(TheNewsApp(dark: dark));
}

class TheNewsApp extends StatelessWidget {
  final bool? dark;

  const TheNewsApp({super.key, required this.dark}); // constructor

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CubitThemes()..chaneColorsThmes(darKSaveMain: dark)),
        BlocProvider(
            create: (context) => CubitNewsApp(getit.get<RepoNSCFSImplement>())),
        BlocProvider(
            create: (context) =>
                SportsCubit(getit.get<RepoNSCFSImplement>())..fetchSports()),
        BlocProvider(
            create: (context) =>
                ScienceCubit(getit.get<RepoNSCFSImplement>())..fetchcin()),
        BlocProvider(
            create: (context) =>
                ScienceCubit(getit.get<RepoNSCFSImplement>())..fetchcin()),
        BlocProvider(
            create: (context) =>
                CubitBussinusCubit(getit.get<RepoNSCFSImplement>())
                  ..fetchBuss())
      ],
      child: BlocConsumer<CubitThemes, SuperChangeThemeState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp.router(
          ////////////////////////
          theme: AppThemes.themeDataLight,
          ///////////////////////////

          darkTheme: AppThemes.themeDataDark,

          //////////////////////////
          themeMode: CubitThemes.getCubitThemes(context).darkth
              ? ThemeMode.dark
              : ThemeMode.light,

          ////////////////
          routerConfig: AppRoute.goRouter,
          // home: const Directionality(
          //     textDirection: TextDirection.rtl, child: BottomApp()),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

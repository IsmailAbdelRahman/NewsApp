import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/utils/app_themes.dart';
import 'package:newsappnew/core/widget/bottom_app.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_change_theme/cubit_change_theme.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_change_theme/state_change_theme.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/cubit_news_app.dart';
import 'package:newsappnew/feature/allm/cubites_manger/observer.dart';
import 'package:newsappnew/core/utils/dio_helper.dart';
import 'package:newsappnew/core/utils/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.initi();

  await SPreferences.iNitialSPreferen();
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
        BlocProvider(create: (context) => CubitNewsApp()..getDataSports()),
      ],
      child: BlocConsumer<CubitThemes, SuperChangeThemeState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          theme: AppThemes.themeDataLight,
          ///////////////////////////

          darkTheme: AppThemes.themeDataDark,

          //////////////////////////
          themeMode: CubitThemes.getCubitThemes(context).darkth
              ? ThemeMode.dark
              : ThemeMode.light,

          ////////////////

          home: const Directionality(
              textDirection: TextDirection.rtl, child: BottomApp()),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/Cubites/Cubit_Changetheme/CubitChangeTheme.dart';
import 'package:newsappnew/Cubites/Cubit_Changetheme/StateChangeTheme.dart';
import 'package:newsappnew/services/Networt/remote/dio_helper.dart';
import 'package:newsappnew/services/Shared_Preferences/C_Shared_Preferences.dart';
import 'package:newsappnew/utils/app_themes.dart';
import 'bottom_app.dart';
import 'Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import 'Cubites/Observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.initi();

  await Sh_Preferences.INitial_Sh_preferen();
  bool? dark = Sh_Preferences.getData(key: 'dark');
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
                CubitThemes()..ChaneColorsThmes(darKSaveMain: dark)),
        BlocProvider(create: (context) => CubitNewsApp()..getDataSports()),
      ],
      child: BlocConsumer<CubitThemes, SuperChangeThemeState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          theme: AppThemes.themeDataLight,
          ///////////////////////////

          darkTheme: AppThemes.themeDataDark,

          //////////////////////////
          themeMode: CubitThemes.getCubitThemes(context).Dark
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

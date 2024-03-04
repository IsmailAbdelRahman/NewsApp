import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/Cubites/Cubit_Changetheme/CubitChangeTheme.dart';
import 'package:newsappnew/Cubites/Cubit_Changetheme/StateChangeTheme.dart';
import 'package:newsappnew/services/Networt/remote/dio_helper.dart';
import 'package:newsappnew/services/Shared_Preferences/C_Shared_Preferences.dart';
import 'package:newsappnew/testOne.dart';
import 'views/HomeNewsOne.dart';
import 'Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import 'Cubites/Observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.initi();

  await Sh_Preferences.INitial_Sh_preferen();
  bool? dark = Sh_Preferences.getData(
      key: 'dark'); //value true  false  باخد اخر قيمه كنت حفظها بدلاله الكى
  runApp(theNewsApp(dark: dark));
}

class theNewsApp extends StatelessWidget {
  final bool? dark; // variable or attribute

  const theNewsApp(
      {super.key, required this.dark /*parameter*/}); // constructor

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CubitThemes()..ChaneColorsThmes(darKSaveMain: dark)),
        BlocProvider(create: (context) => CubitNewsApp() /*..getDataSports()*/),
      ],
      child: BlocConsumer<CubitThemes, SuperChangeThemeState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
//false & true
// float    floating

          theme: ThemeData(
            textTheme: const TextTheme(
                bodyLarge: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(color: Colors.black),
                color: Colors.white,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark)),
            iconTheme: const IconThemeData(color: Colors.black),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 5,
                selectedIconTheme: IconThemeData(color: Colors.deepOrange),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.black),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange),
          ),

          ///////////////////////////

          darkTheme: ThemeData(
            textTheme: const TextTheme(
                bodyLarge: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xff464646),
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xff464646),
                  statusBarIconBrightness: Brightness.light,
                )),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color(0xff464646),
                elevation: 5,
                selectedIconTheme: IconThemeData(color: Colors.deepOrange),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(),
            scaffoldBackgroundColor: const Color(0xff464646),
            cardTheme: const CardTheme(color: Color(0xff464646), elevation: 10),
            iconTheme: const IconThemeData(color: Colors.white),
            //  colorScheme: const ColorScheme(background: Color(0xff464646)),
          ),

          //////////////////////////
          themeMode: CubitThemes.getCubitThemes(context).Dark
              ? ThemeMode.dark
              : ThemeMode.light,

          ////////////////

          home: Directionality(
            textDirection: TextDirection.rtl,
            //  child: HomeNewsOne()
            child: TestOne(),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

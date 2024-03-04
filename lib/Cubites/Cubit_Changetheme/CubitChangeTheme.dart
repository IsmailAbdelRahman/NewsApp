import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/Cubites/Cubit_Changetheme/StateChangeTheme.dart';
import 'package:newsappnew/services/Shared_Preferences/C_Shared_Preferences.dart';

class CubitThemes extends Cubit<SuperChangeThemeState> {
  CubitThemes() : super(InitialStateChangeThemeState());

  static CubitThemes getCubitThemes(context) => BlocProvider.of(context);

  ///التارجت بين حاجتين يبقا بولين
  /// التارجت بين اكثر من حاجتين يبقا سوتش او اف

  // ThemeMode  ChangeColorThemeMode = ThemeMode.light ;

  bool Dark = true; // بلسن ع دى
  void ChaneColorsThmes({bool? darKSaveMain}) {
    if (darKSaveMain != null) {
      // اول مابفتح التطبيق بديلو اخر قيمه كنت حفظها ف الريفرنس
      Dark = darKSaveMain; /*print(darKSaveMain);*/
      emit(ChangeThemesState());
    } else {
      // استدعيتو فاضى عن طريق الزرار
      Dark = !Dark;
      print(darKSaveMain);
      Sh_Preferences.PutData(key: 'dark', value: Dark)
          .then((value) => emit(ChangeThemesState()));
    }
  }
}

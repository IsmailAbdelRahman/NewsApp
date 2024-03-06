import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_change_theme/state_change_theme.dart';
import 'package:newsappnew/core/utils/shared_preferences.dart';

class CubitThemes extends Cubit<SuperChangeThemeState> {
  CubitThemes() : super(InitialStateChangeThemeState());

  static CubitThemes getCubitThemes(context) => BlocProvider.of(context);

  bool darkth = true;
  void chaneColorsThmes({bool? darKSaveMain}) {
    if (darKSaveMain != null) {
      darkth = darKSaveMain;
      emit(ChangeThemesState());
    } else {
      darkth = !darkth;
      //  print(darKSaveMain);
      SPreferences.putData(key: 'dark', value: darkth)
          .then((value) => emit(ChangeThemesState()));
    }
  }
}

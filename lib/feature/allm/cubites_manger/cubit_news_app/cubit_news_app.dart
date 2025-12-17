import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/state_news.dart';
import 'package:newsappnew/feature/allm/domain/repos/repos_app.dart';
import 'package:newsappnew/feature/business/presetation/views/business_view.dart';
import 'package:newsappnew/feature/science/presetation/views/home_view_science_app.dart';
import 'package:newsappnew/feature/sports/presetation/views/sports_view.dart';

class CubitNewsApp extends Cubit<SuperNewsAppState> {
  CubitNewsApp(this.repo) : super(InitialStateNewsApp());

  static CubitNewsApp get(context) => BlocProvider.of(context);
  RepoApp repo;

////////////////////

  List<Widget> sCreens = [
    const SportView(),
    const ScienceView(),
    const BussinusView(),
  ];

  int index = 1;

  void changeIndex(int index) {
    this.index = index;

    emit(ChangeStateIndexBottomNavigation());
  }

////////////////////////////////////////////////
//////////////////////////////////////
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/feature/business/presetation/views/business_view.dart';
import 'package:newsappnew/feature/home/presetation/views/home_view_news_app.dart';
import 'package:newsappnew/feature/sports/presetation/views/sports_view.dart';
import 'package:newsappnew/utils/app_constant.dart';
import 'package:newsappnew/views/S_Setting.dart';
import 'package:newsappnew/Cubites/Cubit_NewsApp/StateNews.dart';
import 'package:flutter/material.dart';

import '../../services/Networt/remote/dio_helper.dart';

class CubitNewsApp extends Cubit<SuperNewsAppState> {
  CubitNewsApp() : super(InitialStateNewsApp());

  static CubitNewsApp get(context) => BlocProvider.of(context);

////////////////////

  List<Widget> sCreens = [
    const SportsView(),
    const HomeViewNewsApp(),
    const BusinessView(),
    const SettingView(),
  ];

  int index = 0;

  void changeIndex(int index) {
    if (index == 1) {
    } else if (index == 2) {
      getDataBusiness();
    }
    this.index = index;

    emit(ChangeStateIndexBottomNavigation());
  }

  List<dynamic> listDataNews = [];
  void getDataNews() {
    emit(LoadingDataNewsState());
    if (listDataNews.isEmpty) {
      DioHelper.get(url: 'v2/top-headlines', queryParameter: {
        'country': 'us',
        'category': 'technology',
        'apiKey': 'dc7a0a614fd147d4af9e89f5d3bc4553'
      }).then((value) {
        emit(GetDataNewsState());
      }).catchError((er) {
        emit(ErrorDataNewsState(er));
      });
    } else {
      emit(successGatDataher());
    }
  }

//////////////////////////////////////////

  ////////////////////////////////

  List<dynamic> listDataBusiness = [];
  void getDataBusiness() {
    emit(LoadingDataBusinessState());
    if (listDataBusiness.isEmpty) {
      DioHelper.get(
              url: AppConstant.url2andKay,
              queryParameter: {'category': 'sports', "country": "eg"})
          .then((value) {
        emit(GetDataBusinessState());
      }).catchError((er) {
        emit(ErrorDataBusinessState());
      });
    } else {
      emit(successGatDataher());
    }
  }

///////////////////////////////////////
///////////////////////////
  List<dynamic> listDataSports = [];
  void getDataSports() {
    emit(LoadingDataSportsState());
    if (listDataSports.isEmpty) {
      DioHelper.get(url: AppConstant.url2andKay, queryParameter: {
        'country': 'us',
        'category': 'sports',
      }).then((value) {
        listDataSports = value.data['articles'];
        emit(GetDataSportsState());
      }).catchError((er) {
        emit(ErrorDataSportsState());
      });
    } else {
      emit(successGatDataher());
    }
  }

////////////////////////////////////////////////
//////////////////////////////////////

  List<dynamic> listDataSearch = [];
  void getDataSearch(String value) {
    emit(LoadingDataSearchState());
    //////////////////
    DioHelper.get(
        url: '/v2/everything?apiKey=6cd14d2183fc4b709f88fc81a9ecb9cc',
        queryParameter: {
          'q': value,
        }).then((value) {
      // print(value.data);
      listDataSearch = value.data['articles'];
      emit(GetDataSearchState());
    }).catchError((er) {
      emit(ErrorDataSearchState());
    });
  }
}

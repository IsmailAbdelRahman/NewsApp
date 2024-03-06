import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/utils/app_constant.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/state_news.dart';
import 'package:newsappnew/core/utils/dio_helper.dart';
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
    if (index == 1) {
    } else if (index == 2) {
      //  getDataBusiness();
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
      emit(SuccessGatDataher());
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
      emit(SuccessGatDataher());
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
      emit(SuccessGatDataher());
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

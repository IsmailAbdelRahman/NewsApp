import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/Models/article_model.dart';
import 'package:newsappnew/utils/app_constant.dart';
import 'package:newsappnew/views/S_Business.dart';
import 'package:newsappnew/views/S_News.dart';
import 'package:newsappnew/views/S_Setting.dart';
import 'package:newsappnew/views/S_Sports.dart';
import 'package:newsappnew/Cubites/Cubit_NewsApp/StateNews.dart';
import 'package:flutter/material.dart';

import '../../services/Networt/remote/dio_helper.dart';

class CubitNewsApp extends Cubit<SuperNewsAppState> {
  CubitNewsApp() : super(InitialStateNewsApp());

  static CubitNewsApp get(context) => BlocProvider.of(context);
////////////////////

  List<Widget> SCreens = [
    const S_Sports(),
    const S_News(),
    const S_Business(),
    const S_setting(),
  ];

///////////////// وجهه نظري
/*

  int index =1;
 void ChangeIndex (int index){
    ListDataNews.length=0;
    if (index==1){ getDataNews(map: {'country':'eg' ,'category' : 'sports' ,'apiKey':'dc7a0a614fd147d4af9e89f5d3bc4553'} );
    } else if(index==2){ getDataNews(map: {'country':'eg' ,'category' : 'business' ,'apiKey':'dc7a0a614fd147d4af9e89f5d3bc4553'} ); }
   this.index = index;

   emit(ChangeStateIndexBottomNavigation());
 }


    List<dynamic> ListDataNews =[];
 void getDataNews({dynamic map} ){
     emit(LoadingDataNewsState());

       DioHelper.get(url: 'v2/top-headlines', queryParameter: map ).then((value) {
         print(value.data);
         ListDataNews=value.data['articles'];
         emit(GetDataNewsState());
       }).catchError((er){print('er: $er');
       emit(ErrorDataNewsState(  er));
       });

 }
*/

//////////////////////////////

  int index = 0;
  void ChangeIndex(int index) {
    if (index == 1) {
      getDataNews();
    } else if (index == 2) {
      getDataBusiness();
    }
    this.index = index;
    emit(ChangeStateIndexBottomNavigation());
  }

  List<dynamic> ListDataNews = [];
  // List<Map<String, dynamic>> ListDataNews1 =[];
  void getDataNews() {
    emit(LoadingDataNewsState());
    if (ListDataNews.isEmpty) {
      DioHelper.get(url: 'v2/top-headlines', queryParameter: {
        'country': 'us',
        'category': 'technology',
        'apiKey': 'dc7a0a614fd147d4af9e89f5d3bc4553'
      }).then((value) {
        // ListDataNews1=value.data['articles']as List<Map<String, dynamic>>;
        // الشكل الاطف انى اعمل كدا \
        print(value.data);
        //  ListDataNews = value.data['articles'];

        // List<ArticleModel> s1 = [
        //   ArticleModel(
        //     title: value.data['articales']['title'],
        //     url: value.data['articales']['url'],
        //     urlToImage: value.data['articales']['urlToImage'],
        //   )
        // ];

/////////////////////////////??//////////////////////
        // List<ArticleModel> listAr =[];
        // for (int x = 1; x == 8; x++) {
        //   ArticleModel r0 = ArticleModel(
        //     title: value.data['articles'][x]['title'],
        //     url: value.data['articles'][x]['url'],
        //     urlToImage: value.data['articles'][x]['urlToImage'],
        //   );
        //   listAr.add(r0);
        // }

        // print(listAr);
        // print(
        //   value.data["articles"][0]['title'],
        // );

        ////////////////////new//////////////////////

        // jsondart j = jsondart.fromJson(value.data);

        // print(j.articles?[1].title);

        emit(GetDataNewsState());
      }).catchError((er) {
        print('er: $er');
        emit(ErrorDataNewsState(er));
      });
    } else {
      emit(successGatDataher());
    }
  }

//////////////////////////////////////////
  ///
  ///
  ///example  2  coruse tharwat shame

  Future<List<ArticleModel>> getDataNewsExapleTo() async {
    ///////////////////////////tharwat shame  conver map to object ///////////////////////////////////

    List<ArticleModel> listAr = [];
    for (var article in ListDataNews) {
      ArticleModel r1 = ArticleModel(
          title: article["title"],
          url: article["url"],
          urlToImage: article["urlToImage"]);

      listAr.add(r1);
    }
    // print(ListDataNews);
    //  print(listAr);
    // ignore: await_only_futures
    return await listAr;
  }

  ////////////////////////////////

  List<dynamic> ListDataBusiness = [];
  void getDataBusiness() {
    emit(LoadingDataBusinessState());
    if (ListDataBusiness.isEmpty) {
      DioHelper.get(
              url: AppConstant.url2andKay,
              queryParameter: {'category': 'sports', "country": "eg"})
          .then((value) {
        print(value.data);
        //ListDataBusiness = value.data['articles'];
        emit(GetDataBusinessState());
      }).catchError((er) {
        print('er: $er');
        emit(ErrorDataBusinessState());
      });
    } else {
      emit(successGatDataher());
    }
  }

  List<dynamic> ListDataSports = [];
  void getDataSports() {
    emit(LoadingDataSportsState());
    if (ListDataSports.isEmpty) {
      //////////////////
      DioHelper.get(url: AppConstant.url2andKay, queryParameter: {
        'country': 'us',
        'category': 'sports',
      }).then((value) {
        print(value.data);
        ListDataSports = value.data['articles'];
        emit(GetDataSportsState());
      }).catchError((er) {
        //  print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
        print(er);
        emit(ErrorDataSportsState());
      });
    } else {
      emit(successGatDataher());
    }
  }

////////////////////// search
//https://newsapi.org/v2/everything?q=apple&apiKey=dc7a0a614fd147d4af9e89f5d3bc4553

  List<dynamic> ListDataSearch = [];
  void getDataSearch(String value) {
    emit(LoadingDataSearchState());
    //////////////////
    DioHelper.get(
        url: '/v2/everything?apiKey=6cd14d2183fc4b709f88fc81a9ecb9cc',
        queryParameter: {
          'q': value,
        }).then((value) {
      // print(value.data);
      ListDataSearch = value.data['articles'];
      emit(GetDataSearchState());
    }).catchError((er) {
      emit(ErrorDataSearchState());
    });
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/Cubites/Cubit_Changetheme/CubitChangeTheme.dart';
import 'package:newsappnew/Components/Component.dart';
import '../Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import '../Cubites/Cubit_NewsApp/StateNews.dart';
import 'P_Search.dart';

class HomeNewsOne extends StatelessWidget {
  const HomeNewsOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsApp, SuperNewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          CubitNewsApp CubitNews = CubitNewsApp.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('NewsApp', style: TextStyle(fontSize: 20)),
              actions: [
                IconButton(
                    onPressed: () {
                      NavigationTo(context, P_Search());
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      CubitThemes.getCubitThemes(context).ChaneColorsThmes();
                    },
                    icon: Icon(
                      CubitThemes.getCubitThemes(context).Dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: CubitThemes.getCubitThemes(context).Dark
                          ? Colors.white
                          : Colors.black,
                    ))
              ],
            ),
            /* floatingActionButton: FloatingActionButton(onPressed: (){
                                                                     //Key    : value,   Key   : value     ,   Key  : value
          //  DioHelper.get(url: 'v2/top-headlines', queryParameter: { 'country':'us' ,'apiKey':'dc7a0a614fd147d4af9e89f5d3bc4553'}).then((value) => print(value.data)).catchError((er){print('er: $er');});
            //  CubitNews.getDataNews();
          //  print(CubitNews.ListDataNews[3]['title']);
            print(CubitNews.ListDataNews);


          },child:Icon(Icons.add) , ),*/

            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                CubitNews.ChangeIndex(index);
              },

              currentIndex: CubitNews.index,
              // unselectedItemColor: Colors.black,
              // showSelectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_baseball), label: 'Sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fiber_new_sharp), label: 'News'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business_sharp), label: 'Business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Setting')
              ],
            ),
            body: CubitNews.SCreens[CubitNews.index],
          );
        });
  }
}

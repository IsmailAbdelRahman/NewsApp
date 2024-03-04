import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/Cubites/Cubit_Changetheme/CubitChangeTheme.dart';
import 'package:newsappnew/Components/Component.dart';
import 'package:newsappnew/feature/search/presetation/views/search_view.dart';
import 'Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import 'Cubites/Cubit_NewsApp/StateNews.dart';

class BottomApp extends StatelessWidget {
  const BottomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsApp, SuperNewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          CubitNewsApp cubitNews = CubitNewsApp.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('NewsApp', style: TextStyle(fontSize: 20)),
              actions: [
                IconButton(
                    onPressed: () {
                      navigationTo(context, SearchView());
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
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubitNews.changeIndex(index);
              },
              currentIndex: cubitNews.index,
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
            body: cubitNews.sCreens[cubitNews.index],
          );
        });
  }
}

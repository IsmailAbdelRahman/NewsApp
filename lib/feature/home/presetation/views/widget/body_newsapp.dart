import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/Components/Component.dart';
import 'package:newsappnew/Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import 'package:newsappnew/Cubites/Cubit_NewsApp/StateNews.dart';

class BodyNewsApp extends StatelessWidget {
  const BodyNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsApp, SuperNewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          List listCubitNews = CubitNewsApp.get(context).listDataNews;
          return articlBuilder(listCubitNews);
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/widget/Component.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/cubit_news_app.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/state_news.dart';

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

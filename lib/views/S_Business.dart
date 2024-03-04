import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import '../Cubites/Cubit_NewsApp/StateNews.dart';
import '../Components/Component.dart';

class S_Business extends StatelessWidget {
  const S_Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsApp, SuperNewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          CubitNewsApp CubitBusiness = CubitNewsApp.get(context);

          //  if(CubitNews.ListDataNews.isEmpty) CubitNews.getDataNews(map: {'country':'eg' ,'category' : 'technology' ,'apiKey':'dc7a0a614fd147d4af9e89f5d3bc4553'});

          List ListCubitBusiness = CubitNewsApp.get(context).ListDataBusiness;
          return articlBuilder(ListCubitBusiness);
        });
  }
}

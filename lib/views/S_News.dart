import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:newsappnew/Cubites/Cubit_NewsApp/StateNews.dart';
import '../Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import '../Components/Component.dart';

class S_News extends StatelessWidget {
  const S_News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsApp, SuperNewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          //if(state is ErrorDataNewsState){print(  'ErrorDataNewsStateOne________ ${state.Error}' );   }

          // if(CubitNews.ListDataNews.isEmpty) CubitNews.getDataNews(map: {'country':'eg' ,'category' : 'sports' ,'apiKey':'dc7a0a614fd147d4af9e89f5d3bc4553'}); //وجهه نظري قبل التعديل وعملها في الاندكس
          // 12        CubitNewsApp CubitNews = CubitNewsApp.get(context);
          ///////////////////////////////////////////////////////////////////////
          ///
          List ListCubitNews = CubitNewsApp.get(context).ListDataNews;

          ///send list
          return articlBuilder(ListCubitNews);

          // return LayoutBuilder(builder: (context, BoxConstrain) {
          //   if (BoxConstrain.maxWidth >= 100) {
          //     return articlBuilder(ListCubitNews);
          //   }

          //   return Container(
          //     child: const Center(child: Text("data")),
          //   );
          // });

          ////////////////// tharwat same
          // return FutureBuilder(
          //     future: CubitNewsApp.get(context).getDataNewsExapleTo(),
          //     builder: (context, snapshot) {

          ///send object
          //       return articlBuilder(snapshot.data); // snapshot.data[0].title
          //     });

          // return articlBuilder(ListCubitNews ,CubitNewsApp: CubitNews);

          //12
          /* return */ /*state is LoadingDataNewsState */ /* CubitNews.ListDataNews.length <1 ? Center(child: Lottie.asset('assets/lottie/112463-loader.json')) : ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context ,_)=>  CoustemCategre( context: context, title:CubitNews.ListDataNews[_]['title']  ,UrlNetImage:CubitNews.ListDataNews[_]['urlToImage'].toString() ,Data:CubitNews.ListDataNews[_]['publishedAt'].toString()  ),
              itemCount:CubitNews.ListDataNews.length  );
          */
        });
  }
}

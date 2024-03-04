import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsappnew/views/S_webView.dart';

Widget CoustemCategre(
    {required String title,
    required String UrlNetImage,
    required String Data,
    context}) {
  String Photo =
      'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi8V8DdR7owOaOymCYTCrYh8fm9uceB5ETuoslBxZsQ-JehnW7mPSq37cACOZcq0ZpHWtXdrglG9j31QUfCMd9LFWBPRCm_44iQBHFex2VMFByuO6KRfwUzUraIQSI2Ti8At1DDCSi_glEQW-LGjXtN9mA7bJ1Evx9cMHYoUfP7F-2k_WnEwVsTgXVQ/s1170/%D8%A7%D8%AC%D9%85%D9%84-%D8%B5%D9%88%D8%B1-%D9%84%D9%88%D9%81%D9%8A.jpg';
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(50))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 15,
      child: Row(
        //  mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 170,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        UrlNetImage == 'null' ? Photo : UrlNetImage.toString()),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              width: 170,
              height: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                
                  Expanded(
                      flex: 8,
                      child: Text(
                        title == null ? 'Null' : title,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      )),
                  Expanded(flex: 1, child: Text(Data))
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

void NavigationTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

Widget articlBuilder(list, {bool IsSearch = false}) {
  return /*state is LoadingDataNewsState */ list.length < 1
      ? IsSearch
          ? Container()
          : Center(child: Lottie.asset('assets/lottie/112463-loader.json'))
      : ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, _) => InkWell(
              onTap: () {
                NavigationTo(context, S_WebView(list[_]['url']));
              },
              child: CoustemCategre(
                  context: context,
                  title: list[_]['title'],
                  UrlNetImage: list[_]['urlToImage'].toString(),
                  Data: list[_]['publishedAt'].toString())),
          itemCount: list.length);
}

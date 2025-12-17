import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/cubit_news_app.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/state_news.dart';

class TestOne extends StatelessWidget {
  const TestOne({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitNewsApp, SuperNewsAppState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: ElevatedButton(
                  onPressed: () {
                    // testdio.fetchCategory().then((value) {
                    //   value.fold((l) => null, (r) {
                    //     for (var element in r) {
                    //       print(element.title);
                    //     }
                    //   });
                    // }); //? good

                    // testdio.fetchNewsApp().then((value) {
                    //   value.fold((l) => null, (r) {
                    //     for (var element in r) {
                    //       print(element.title);
                    //     }
                    //   });
                    // }); //? good
                    // print(
                    //     "------------------------------------------------------");
                    // testdio.funTestabdull();//?good

                    // print(
                    //     "------------------------------------------------------");
                    //  testdio.funTestThen(); //? good
                  },
                  child: const Icon(Icons.abc_sharp))),
        );
      },
    );
  }
}

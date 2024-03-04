import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import 'package:newsappnew/Cubites/Cubit_NewsApp/StateNews.dart';
import 'package:newsappnew/Models/article_model.dart';
import 'package:newsappnew/domain/repos/repo_n_s_c_f_s_implement.dart';
import 'package:newsappnew/services/Networt/remote/dio_helper.dart';
import 'package:newsappnew/utils/errors/failure.dart';

class TestOne extends StatelessWidget {
  var testdio = RepoNSCFSImplement(ServicesDio(Dio()));

  TestOne({super.key});
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

                    print(
                        "------------------------------------------------------");

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
                    testdio.funTestThen(); //? good
                  },
                  child: const Icon(Icons.abc_sharp))),
        );
      },
    );
  }
}

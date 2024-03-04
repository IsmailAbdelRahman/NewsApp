import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import '../Cubites/Cubit_NewsApp/StateNews.dart';
import '../Components/Component.dart';

class S_Sports extends StatelessWidget {
  const S_Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* // مش لازم اعمل البلوك كنسمر
    return articlBuilder(CubitNewsApp.get(context).ListDataSports);*/ // بس ملحوظه لمه معملتش كنسمر هو لمه دخلت ع الصفحه السبورت معملش ريلبلد لمه جاب الداتا
    // عمل ريبلد لمه عملت الكنسمر لانو اخد الكونتكس بتعتها مش بتعت البيلد داله استيت لست

    return BlocConsumer<CubitNewsApp, SuperNewsAppState>(
        builder: (context, state) {
          return articlBuilder(CubitNewsApp.get(context).ListDataSports);
        },
        listener: (context, state) {});
  }
}

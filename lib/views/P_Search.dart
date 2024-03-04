import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/Cubites/Cubit_NewsApp/StateNews.dart';
import '../Cubites/Cubit_NewsApp/CubitNewsApp.dart';
import '../Components/Component.dart';

class P_Search extends StatelessWidget {
  P_Search({Key? key}) : super(key: key);

  var Controller = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsApp, SuperNewsAppState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Form(
                key: formState,
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  controller: Controller,
                  maxLines: 1, keyboardType: TextInputType.name,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      //  print('value null');
                      return "null";
                    } else {
                      //  return value;
                      return null;
                    }
                  },
                  ///////////////
                  onChanged: (value) {
                    if (formState.currentState!.validate()) {
                      CubitNewsApp.get(context).getDataSearch(value);
                    }
                  },
                ),
              ),
            ),

            ///textFormField
            Expanded(
                child: articlBuilder(CubitNewsApp.get(context).ListDataSearch,
                    IsSearch: true))
          ],
        ),
      ),
    );
  }
}

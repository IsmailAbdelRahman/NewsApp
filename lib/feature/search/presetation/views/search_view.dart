import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/widget/Component.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/cubit_news_app.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_news_app/state_news.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  var controller = TextEditingController();
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
                  controller: controller,
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
                child: articlBuilder(CubitNewsApp.get(context).listDataSearch,
                    isSearch: true))
          ],
        ),
      ),
    );
  }
}

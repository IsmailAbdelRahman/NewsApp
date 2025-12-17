import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/widget/Component.dart';
import 'package:newsappnew/feature/search/presetation/manger/cubit_search/cubit_search_cubit.dart';

class BodySearchView extends StatelessWidget {
  BodySearchView({Key? key}) : super(key: key);

  var controller = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitSearchCubit, CubitSearchState>(
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
                      BlocProvider.of<CubitSearchCubit>(context)
                          .getDataSearch(value);
                    }
                  },
                ),
              ),
            ),

            ///textFormField
            Expanded(
                child: articlBuilder(
                    BlocProvider.of<CubitSearchCubit>(context).listDataSearch,
                    isSearch: true))
          ],
        ),
      ),
    );
  }
}

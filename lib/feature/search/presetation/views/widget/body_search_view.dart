import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/feature/search/presetation/manger/cubit_search/cubit_search_cubit.dart';
import 'package:newsappnew/feature/search/presetation/views/search_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitSearchCubit(),
      child: Scaffold(body: SafeArea(child: BodySearchView())),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/widget/component.dart';
import 'package:newsappnew/feature/business/presetation/manger/bussinus_cubit/cubit_bussinus_cubit.dart';

class BodyBussines extends StatelessWidget {
  const BodyBussines({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitBussinusCubit, CubitBussinusState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SecssfullyBuss) {
            return articlBuilderObject(state.dataBuss);
          } else if (state is ErrorBuss) {
            return Center(child: Text(state.err.toString()));
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

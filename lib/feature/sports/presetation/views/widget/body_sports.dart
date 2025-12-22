import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/widget/Component.dart';
import 'package:newsappnew/feature/sports/presetation/sports_cubit/sports_cubit.dart';

class BodySport extends StatelessWidget {
  const BodySport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportsCubit, SportsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SuccessfullySports) {
            return articlBuilderObject(state.dataSports);
          } else if (state is ErrorSports) {
            return Center(child: Text(state.err.toString()));
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

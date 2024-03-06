import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/widget/Component.dart';
import 'package:newsappnew/core/widget/card_dr.dart';
import 'package:newsappnew/core/widget/custom_widget_error.dart';
import 'package:newsappnew/feature/science/presetation/manger/cubit/science_cubit.dart';

class BodyScience extends StatelessWidget {
  const BodyScience({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScienceCubit, ScienceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SecssfullySin) {
            return Scaffold(
              // appBar: AppBar(
              //   systemOverlayStyle: SystemUiOverlayStyle.light,
              //   backgroundColor: Colors.transparent,
              //   elevation: 0,
              //   leading: Builder(
              //     builder: (context) => IconButton(
              //       onPressed: () => Scaffold.of(context).openDrawer(),
              //       icon: const Icon(
              //         Icons.menu,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
              // extendBodyBehindAppBar: true,
              drawer: const Drawer(),
              body: CustomScrollView(
                //  physics: const NeverScrollableScrollPhysics(),
                physics: const BouncingScrollPhysics(),

                slivers: [
                  SliverToBoxAdapter(
                    child: CardDer(stateArticle: state.dataSin),
                  ),
                  SliverFillRemaining(
                    child: articlBuilderObject(state.dataSin),
                  )
                ],
              ),
            );
          } else if (state is ErrorSin) {
            return Center(child: Text(state.err.toString()));
          }

          return const CustomWidgetError();
        });
  }
}

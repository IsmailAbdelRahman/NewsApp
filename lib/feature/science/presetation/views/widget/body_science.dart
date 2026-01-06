import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsappnew/core/utils/app_route.dart';
import 'package:newsappnew/core/widget/carouse_view.dart';
import 'package:newsappnew/core/widget/component.dart';
import 'package:newsappnew/core/widget/card_dr.dart';
import 'package:newsappnew/core/widget/custom_widget_error.dart';
import 'package:newsappnew/feature/allm/cubites_manger/cubit_change_theme/cubit_change_theme.dart';
import 'package:newsappnew/feature/science/presetation/manger/cubit/science_cubit.dart';

class BodyScience extends StatelessWidget {
  const BodyScience({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScienceCubit, ScienceState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SecssfullySin) {
          return SafeArea(
            child: Scaffold(
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
              //  drawer: const Drawer(),
              body: CustomScrollView(
                //  physics: const NeverScrollableScrollPhysics(),
                physics: const BouncingScrollPhysics(),

                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        // CardDer(stateArticle: state.dataSin),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.39,
                          width: double.infinity,

                          child: CarouselExample(stateArticle: state.dataSin),
                        ),

                        SizedBox(
                          height: 100,
                          width: 200,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  GoRouter.of(
                                    context,
                                  ).push(AppRoute.searchView);
                                  // navigationTo(context, SearchView());
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  CubitThemes.getCubitThemes(
                                    context,
                                  ).changeColorThemes();
                                },
                                icon: Icon(
                                  CubitThemes.getCubitThemes(context).darkth
                                      ? Icons.light_mode
                                      : Icons.dark_mode,
                                  color:
                                      CubitThemes.getCubitThemes(context).darkth
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    child: articlBuilderObject(state.dataSin),
                  ),
                ],
              ),
            ),
          );
        } else if (state is ErrorSin) {
          return Center(child: Text(state.err.toString()));
        }

        return const CustomWidgetError();
      },
    );
  }
}

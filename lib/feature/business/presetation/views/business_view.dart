import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappnew/core/utils/service_locator_getit.dart';
import 'package:newsappnew/feature/allm/domain/repos/repo_n_s_c_f_s_implement.dart';
import 'package:newsappnew/feature/business/presetation/manger/bussinus_cubit/cubit_bussinus_cubit.dart';
import 'package:newsappnew/feature/business/presetation/views/widget/body_business.dart';

class BussinusView extends StatelessWidget {
  const BussinusView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CubitBussinusCubit(getit.get<RepoNSCFSImplement>())..fetchBuss(),
      child: const BodyBussines(),
    );
  }
}

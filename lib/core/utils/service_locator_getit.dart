import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsappnew/core/utils/dio_helper.dart';
import 'package:newsappnew/feature/allm/domain/repos/repo_n_s_c_f_s_implement.dart';

GetIt getit = GetIt.instance;

void setupServiceLocatorGetit() {
  getit.registerSingleton<RepoNSCFSImplement>(
      RepoNSCFSImplement(ServicesDio(Dio())));

  getit.registerSingleton<ServicesDio>(ServicesDio(Dio()));
}

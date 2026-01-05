import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsappnew/feature/allm/domain/repos/repos_app.dart';
import 'package:newsappnew/feature/allm/models/article_model.dart';

part 'cubit_bussinus_state.dart';

class CubitBussinusCubit extends Cubit<CubitBussinusState> {
  CubitBussinusCubit(this.repo) : super(CubitBussinusInitial());

  RepoApp repo;
  Future<void> fetchBuss() async {
    emit(LodingBuss());
    var result = await repo.fetchBussin();
    result.fold(
        (l) => emit(ErrorBuss(l.errMessage)), (r) => emit(SecssfullyBuss(r)));
  }
}

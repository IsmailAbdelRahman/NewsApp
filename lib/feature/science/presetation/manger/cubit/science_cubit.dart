import 'package:bloc/bloc.dart';
import 'package:newsappnew/feature/allm/domain/repos/repos_app.dart';
import 'package:newsappnew/feature/allm/models/article_model.dart';

part 'science_state.dart';

class ScienceCubit extends Cubit<ScienceState> {
  ScienceCubit(this.repo) : super(ScienceInitial());

  RepoApp repo;
  Future<void> fetchcin() async {
    emit(LodingSin());
    var result = await repo.fetchscience();
    result.fold(
        (l) => emit(ErrorSin(l.errMessage)), (r) => emit(SecssfullySin(r)));
  }
}

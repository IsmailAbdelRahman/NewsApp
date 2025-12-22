import 'package:bloc/bloc.dart';
import 'package:newsappnew/feature/allm/domain/repos/repos_app.dart';
import 'package:newsappnew/feature/allm/models/article_model.dart';

part 'sports_state.dart';

class SportsCubit extends Cubit<SportsState> {
  SportsCubit(this.repo) : super(SportsInitial());

  RepoApp repo;

  Future<void> fetchSports() async {
    emit(LodingSports());
    var result = await repo.fetchSports();
    result.fold((l) => emit(ErrorSports(l.errMessage)),
        (r) => emit(SuccessfullySports(r)));
  }
}

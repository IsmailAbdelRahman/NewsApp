import 'package:bloc/bloc.dart';
import 'package:newsappnew/core/utils/dio_helper.dart';

part 'cubit_search_state.dart';

class CubitSearchCubit extends Cubit<CubitSearchState> {
  CubitSearchCubit() : super(CubitSearchInitial());

  List<dynamic> listDataSearch = [];
  void getDataSearch(String value) {
    emit(LoadingDataSearchState());
    //////////////////
    DioHelper.get(
        url: '/v2/everything?apiKey=6cd14d2183fc4b709f88fc81a9ecb9cc',
        queryParameter: {
          'q': value,
        }).then((value) {
      // print(value.data);
      listDataSearch = value.data['articles'];
      emit(GetDataSearchState());
    }).catchError((er) {
      emit(ErrorDataSearchState());
    });
  }
}

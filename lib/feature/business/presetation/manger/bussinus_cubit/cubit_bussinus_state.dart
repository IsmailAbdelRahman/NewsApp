part of 'cubit_bussinus_cubit.dart';

@immutable
sealed class CubitBussinusState {}

final class CubitBussinusInitial extends CubitBussinusState {}

class LodingBuss extends CubitBussinusState {}

class ErrorBuss extends CubitBussinusState {
  final String err;
  ErrorBuss(this.err);
}

class SecssfullyBuss extends CubitBussinusState {
  final List<ArticleModel> dataBuss;
  SecssfullyBuss(this.dataBuss);
}

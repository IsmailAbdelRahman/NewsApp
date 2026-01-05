part of 'sports_cubit.dart';

sealed class SportsState {}

final class SportsInitial extends SportsState {}

class LodingSports extends SportsState {}

class ErrorSports extends SportsState {
  final String err;
  ErrorSports(this.err);
}

class SuccessfullySports extends SportsState {
  final List<ArticleModel> dataSports;
  SuccessfullySports(this.dataSports);
}

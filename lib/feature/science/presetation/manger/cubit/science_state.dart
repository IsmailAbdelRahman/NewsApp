part of 'science_cubit.dart';

sealed class ScienceState {}

final class ScienceInitial extends ScienceState {}

class LodingSin extends ScienceState {}

class ErrorSin extends ScienceState {
  final String err;
  ErrorSin(this.err);
}

class SecssfullySin extends ScienceState {
  final List<ArticleModel> dataSin;
  SecssfullySin(this.dataSin);
}

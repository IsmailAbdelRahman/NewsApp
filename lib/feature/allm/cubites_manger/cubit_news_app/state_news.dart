import 'package:newsappnew/feature/allm/models/article_model.dart';

abstract class SuperNewsAppState {}

class InitialStateNewsApp extends SuperNewsAppState {}

class ChangeStateIndexBottomNavigation extends SuperNewsAppState {}

///get news
class LoadingDataNewsState extends SuperNewsAppState {}

class GetDataNewsState extends SuperNewsAppState {}

class ErrorDataNewsState extends SuperNewsAppState {
  dynamic Error;
  ErrorDataNewsState(this.Error);
}

/// Success
class SuccessGatDataher extends SuperNewsAppState {}

/// get Business
class LoadingDataBusinessState extends SuperNewsAppState {}

class GetDataBusinessState extends SuperNewsAppState {}

class ErrorDataBusinessState extends SuperNewsAppState {}

/// get Sports
class LoadingDataSportsState extends SuperNewsAppState {}

class GetDataSportsState extends SuperNewsAppState {}

class ErrorDataSportsState extends SuperNewsAppState {}

/// get Search
class LoadingDataSearchState extends SuperNewsAppState {}

class GetDataSearchState extends SuperNewsAppState {}

class ErrorDataSearchState extends SuperNewsAppState {}

//////////////////////////////

///////////////////////
///

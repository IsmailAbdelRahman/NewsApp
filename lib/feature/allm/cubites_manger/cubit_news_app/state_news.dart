abstract class SuperNewsAppState {}

class InitialStateNewsApp extends SuperNewsAppState {}

class ChangeStateIndexBottomNavigation extends SuperNewsAppState {}

///get news
class LoadingDataNewsState extends SuperNewsAppState {}

class GetDataNewsState extends SuperNewsAppState {}

class ErrorDataNewsState extends SuperNewsAppState {
  dynamic error;
  ErrorDataNewsState(this.error);
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
// mod 


//////////////////////////////

///////////////////////
///

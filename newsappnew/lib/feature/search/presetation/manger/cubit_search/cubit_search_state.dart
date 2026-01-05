part of 'cubit_search_cubit.dart';

sealed class CubitSearchState {}

final class CubitSearchInitial extends CubitSearchState {}

/// get Search
class LoadingDataSearchState extends CubitSearchState {}

class GetDataSearchState extends CubitSearchState {}

class ErrorDataSearchState extends CubitSearchState {}

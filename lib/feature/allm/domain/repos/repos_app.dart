import 'package:dartz/dartz.dart';
import 'package:newsappnew/core/errors/failure.dart';
import 'package:newsappnew/feature/allm/models/article_model.dart';

abstract class RepoApp {
  Future<Either<Failure, List<ArticleModel>>> fetchBussin();
  Future<Either<Failure, List<ArticleModel>>> fetchSports();
  Future<Either<Failure, List<ArticleModel>>> fetchscience();
  Future<Either<Failure, List<ArticleModel>>> fetchTec();
  Future<Either<Failure, List<ArticleModel>>> fetchSearch();

  List<ArticleModel> getDataNewsExapleTo({required List<dynamic> lilst});
  void funTestThen();
  void funTestabdull();
}

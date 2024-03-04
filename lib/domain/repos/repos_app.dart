import 'package:dartz/dartz.dart';
import 'package:newsappnew/Models/article_model.dart';
import 'package:newsappnew/utils/errors/failure.dart';

abstract class RepoApp {
  Future<Either<Failure, List<ArticleModel>>> fetchNewsApp();
  Future<Either<Failure, List<ArticleModel>>> fetchSports();
  Future<Either<Failure, List<ArticleModel>>> fetchCategory();
  Future<Either<Failure, List<ArticleModel>>> fetchTec();
  Future<Either<Failure, List<ArticleModel>>> fetchSearch();

  List<ArticleModel> getDataNewsExapleTo({required List<dynamic> lilst});
  void funTestThen();
  void funTestabdull();
}

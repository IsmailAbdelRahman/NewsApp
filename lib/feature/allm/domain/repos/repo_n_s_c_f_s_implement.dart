import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsappnew/core/errors/failure.dart';
import 'package:newsappnew/core/utils/app_constant.dart';
import 'package:newsappnew/feature/allm/domain/repos/repos_app.dart';
import 'package:newsappnew/feature/allm/models/article_model.dart';
import 'package:newsappnew/core/utils/dio_helper.dart';

class RepoNSCFSImplement extends RepoApp {
  RepoNSCFSImplement(this.servicesDio);

  final ServicesDio servicesDio;
  final String url = AppConstant.url2andKay;

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchscience() async {
    try {
      Map<String, dynamic> response =
          await servicesDio.get(point: url, queryParameter: {
        'country': 'us',
        'category': 'science',
      });

      List<dynamic> listN = response['articles'];
      var finalData = getDataNewsExapleTo(lilst: listN); // تم الاختصار

      return right(finalData);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchBussin() async {
    try {
      Map<String, dynamic> response =
          await servicesDio.get(point: url, queryParameter: {
        'country': 'us',
        'category': 'business',
      });

      List<dynamic> listN = response['articles'];
      var finalData = getDataNewsExapleTo(lilst: listN); // تم الاختصار

      return right(finalData);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchSports() async {
    try {
      Map<String, dynamic> response =
          await servicesDio.get(point: url, queryParameter: {
        'country': 'us',
        'category': 'sports',
      });

      List<dynamic> listN = response['articles'];
      var finalData = getDataNewsExapleTo(lilst: listN); // تم الاختصار

      return right(finalData);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchSearch() async {
    try {
      Map<String, dynamic> response =
          await servicesDio.get(point: url, queryParameter: {
        'country': 'eg',
        'category': 's',
      });

      List<dynamic> listN = response['articles'];
      var finalData = getDataNewsExapleTo(lilst: listN); // تم الاختصار

      return right(finalData);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchTec() async {
    try {
      Map<String, dynamic> response =
          await servicesDio.get(point: url, queryParameter: {
        'country': 'eg',
        'category': 'technology',
      });

      List<dynamic> listN = response['articles'];
      var finalData = getDataNewsExapleTo(lilst: listN); // تم الاختصار

      return right(finalData);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  List<ArticleModel> getDataNewsExapleTo({required List lilst}) {
    List<ArticleModel> listAr = [];
    for (var article in lilst) {
      listAr.add(ArticleModel(
          title: article["title"],
          url: article["url"],
          urlToImage: article["urlToImage"]));
    }

    return listAr;
  }

/////////////////////////////////////////////
  @override
  void funTestabdull() {
    // List<dynamic> listDataBusiness = [];

    // servicesDio.ger(point: url, queryParameter: {
    //   'country': 'eg',
    //   'category': 'business',
    // }).then((value) {
    //   listDataBusiness = value['articles'];
    //   print(value);
    // }).catchError((e) {
    //   print(e);
    // });
  }

  @override

  /// then
  void funTestThen() {
    // // thar
    // List<ArticleModel> listAr = [];

    // servicesDio.ger(point: url, queryParameter: {
    //   'country': 'eg',
    //   'category': 'business',
    // }).then((value) {
    //   for (var article in value['articles']) {
    //     listAr.add(ArticleModel(
    //         title: article["title"],
    //         url: article["url"],
    //         urlToImage: article["urlToImage"]));
    //   }

    //   // return listAr;
    //   for (var element in listAr) {
    //     print(element.title);
    //   }
    // }).catchError((e) {
    //   print("errorrrrrrrrrrrrThen");
    //   // return ErrorBullDio();
    // });
  }
}

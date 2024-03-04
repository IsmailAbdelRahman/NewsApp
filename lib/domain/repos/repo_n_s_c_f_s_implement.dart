import 'package:dartz/dartz.dart';
import 'package:newsappnew/Models/article_model.dart';
import 'package:newsappnew/domain/repos/repos_app.dart';
import 'package:newsappnew/services/Networt/remote/dio_helper.dart';
import 'package:newsappnew/utils/app_constant.dart';
import 'package:newsappnew/utils/errors/failure.dart';

class RepoNSCFSImplement extends RepoApp {
  RepoNSCFSImplement(this.servicesDio);

  final ServicesDio servicesDio;
  final String url = AppConstant.url2andKay;

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchCategory() async {
    try {
      Map<String, dynamic> response =
          await servicesDio.ger(point: url, queryParameter: {
        'country': 'us',
        'category': 'business',
      });

      List<ArticleModel> listAr = [];
      for (var article in response['articles']) {
        listAr.add(ArticleModel(
            title: article["title"],
            url: article["url"],
            urlToImage: article["urlToImage"]));
      }

      print(listAr[1].url);
      return right(listAr);
    } catch (e) {
      print("errorrrrrrrrrrrrCategory");
      return left(ErrorBullDio());
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchNewsApp() async {
    try {
      Map<String, dynamic> response =
          await servicesDio.ger(point: url, queryParameter: {
        'country': 'eg',
        'category': 'business',
      });

      List<dynamic> listN = response['articles'];
      var finalData = getDataNewsExapleTo(lilst: listN); // تم الاختصار

      return right(finalData);
    } catch (e) {
      print(" errorrrrrrrrrrrrNews");
      return left(ErrorBullDio());
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchSports() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchSearch() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchTec() {
    throw UnimplementedError();
  }

  @override

  /// then
  void funTestThen() {
    // thar
    List<ArticleModel> listAr = [];

    servicesDio.ger(point: url, queryParameter: {
      'country': 'eg',
      'category': 'business',
    }).then((value) {
      for (var article in value['articles']) {
        listAr.add(ArticleModel(
            title: article["title"],
            url: article["url"],
            urlToImage: article["urlToImage"]));
      }

      // return listAr;
      for (var element in listAr) {
        print(element.title);
      }
    }).catchError((e) {
      print("errorrrrrrrrrrrrThen");
      // return ErrorBullDio();
    });
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

  @override
  void funTestabdull() {
    List<dynamic> listDataBusiness = [];

    servicesDio.ger(point: url, queryParameter: {
      'country': 'eg',
      'category': 'business',
    }).then((value) {
      listDataBusiness = value['articles'];
      print(value);
    }).catchError((e) {
      print(e);
    });
  }
}

class ArticleModel {
  String? title;
  String? url;
  String? urlToImage;
  String? nullImage =
      "https://1.bp.blogspot.com/-9dYWPTjYY2E/X3kPjNje9RI/AAAAAAAAqGY/OnusUWLRgGwv_Z_P3Wm--oYLxy19GrGVACNcBGAsYHQ/s1000/black-wallpapers-images-3.jpg";

  //List<pal> palette;

  ArticleModel(
      {required this.title, required this.url, required this.urlToImage});

  // ArticleModel.json({required dynamic json}) {
  //   title = json["title"];
  //   url = json["url"];
  //   urlToImage = json["urlToImage"];
  // }

  ArticleModel.json2({required List<dynamic> json}) {
    for (var elemted in json) {
      title = elemted["title"] ?? "titlenull";
      url = elemted["url"] ?? nullImage;
      urlToImage = elemted["urlToImage"] ?? nullImage;
    }
  }
}

/////////////////////////////////
///
///
///
///
///
///
class jsondart {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  jsondart({this.status, this.totalResults, this.articles});

  jsondart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  var description;
  String? url;
  var urlToImage;
  String? publishedAt;
  var content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

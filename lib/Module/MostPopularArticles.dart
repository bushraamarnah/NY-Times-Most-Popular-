import 'Media.dart';

class MostPopularArticles {
  int mostPopularID = 0;
  String url = "";
  String publishedDate = "";
  String byLine = "";
  String title = "";
  String details = "";
  String source = "";
  String section = "";
  String subsection = "";
  List<Media> media = <Media>[];

  MostPopularArticles(
      {required this.mostPopularID,
      required this.url,
      required this.byLine,
      required this.title,
      required this.details,
      required this.source,
      required this.section,
      required this.subsection,
      required this.publishedDate,
      required this.media});

  MostPopularArticles.fromJson(Map<String, dynamic> json) {
    mostPopularID = json['id'];
    url = json['url'];
    byLine = json['byline'];
    title = json['title'];
    details = json['abstract'];
    source = json['source'];
    section = json['section'];
    subsection = json['subsection'];
    publishedDate = json['published_date'];
    media = List<Media>.from(json["media"].map((x) => Media.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = mostPopularID;
    data['url'] = url;
    data['byline'] = byLine;
    data['title'] = title;
    data['abstract'] = details;
    data['source'] = source;
    data['section'] = section;
    data['subsection'] = subsection;
    data['published_date'] = publishedDate;
    data['media'] = List<dynamic>.from(media.map((x) => x.toJson()));
    return data;
  }
}

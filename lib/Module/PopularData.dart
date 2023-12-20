import 'package:ny_times_most_popular_articles/Module/MostPopularArticles.dart';

class PopularData {
  int numResults = 0;
  String status = "";
  List<MostPopularArticles> results = <MostPopularArticles>[];

  PopularData(
      {required this.numResults, required this.status, required this.results});

  PopularData.fromJson(Map<String, dynamic> json) {
    numResults = json['num_results'];
    status = json['status'];
    results = List<MostPopularArticles>.from(
        json["results"].map((x) => MostPopularArticles.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['num_results'] = numResults;
    data['status'] = status;
    data['results'] = results;
    return data;
  }
}

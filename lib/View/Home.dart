import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ny_times_most_popular_articles/Module/MostPopularArticles.dart';
import '../Helper/FetchData.dart';
import 'package:http/http.dart' as http;
import 'AppBarDesign.dart';
import 'HomeBody.dart';
import '../Module/PopularData.dart';
import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> colorCodes = <int>[600, 500, 100];
  //late var mostPopularArticles = <MostPopularArticles>[];
  late var popularData = <PopularData>[];
  late List<MostPopularArticles> mostPopularArticles = <MostPopularArticles>[];

  _getMostPopularArticles(BuildContext context) async {
    await API.getAllData().then((response) {
      setState(() {
        if (response.statusCode == 200) {
          var list = json.decode("[" + response.body + "]");
          popularData = list
              .map<PopularData>((model) => PopularData.fromJson(model))
              .toList();
          mostPopularArticles = popularData[0].results;
        } else {
          throw Exception('Failed to load');
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getMostPopularArticles(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: ClipPath(
        child: Container(
          width: 250.0,
          child: Drawer(
            child: AppDrawer(),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarDesign(widget: widget),
      ),
      body: HomeBody(mostPopularArticles: mostPopularArticles),
    );
  }
}

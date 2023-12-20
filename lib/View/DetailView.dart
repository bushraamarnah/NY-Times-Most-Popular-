import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Module/MediaMetaData.dart';
import '../Module/MostPopularArticles.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatefulWidget {
  final MostPopularArticles mostPopularArticles;

  DetailView({required this.mostPopularArticles});

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late MostPopularArticles mostPopularArticles;
  @override
  Widget build(BuildContext context) {
    mostPopularArticles = widget.mostPopularArticles;

    MediaMetaData mediaMetadata =
        MediaMetaData(url: '', width: 0, format: "", height: 0);
    int mediaMetadataLength = 0;

    if (mostPopularArticles.media.isNotEmpty) {
      mediaMetadataLength =
          widget.mostPopularArticles.media[0].mediaMetadata.length;
      mediaMetadata =
          mostPopularArticles.media[0].mediaMetadata[mediaMetadataLength - 1];
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Visibility(
              visible: mostPopularArticles.media.isNotEmpty,
              child: Image.network(
                mediaMetadata.url,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
              ),
            ),
            Padding(
              padding: textPadding(),
              child: Container(
                //height: MediaQuery.of(context).size.height * 3,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        child: Text(
                          mostPopularArticles.title,
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Chip(
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        label: Text(
                          mostPopularArticles.publishedDate,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          mostPopularArticles.details,
                          style: const TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          mostPopularArticles.section,
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Chip(
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          label: Text(
                            mostPopularArticles.byLine,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.all(16),
                        elevation: 20,
                        color: Colors.black12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            InkWell(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(0.9),
                                    BlendMode.darken),
                                child: Column(
                                  children: [
                                    Visibility(
                                      visible:
                                          mostPopularArticles.media.isNotEmpty,
                                      child: Image.network(
                                        mediaMetadata.url,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Visibility(
                                        visible:
                                            mostPopularArticles.media.isEmpty,
                                        child: Container(
                                          height: 50.0,
                                        )),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                await launch(mostPopularArticles.url);
                              },
                            ),
                            const Text(
                              "News Source",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsets textPadding() {
    if (mostPopularArticles.media.isNotEmpty) {
      return const EdgeInsets.fromLTRB(0.0, 340.0, 0.0, 0.0);
    }
    return const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
  }
}

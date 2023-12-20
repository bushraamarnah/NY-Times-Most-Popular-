import 'package:flutter/material.dart';
import '../Module/MostPopularArticles.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'DetailView.dart';

double unitWidthValue = 0;

class HomeBody extends StatefulWidget {
  final List<MostPopularArticles> mostPopularArticles;
  final Color color = const Color(0xff9A9A9A);

  const HomeBody({
    super.key,
    required this.mostPopularArticles,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    unitWidthValue = MediaQuery.of(context).size.width;

    return Center(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: widget.mostPopularArticles.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 150,
              child: Card(
                elevation: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailView(
                          mostPopularArticles:
                              widget.mostPopularArticles[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                height: 50.0,
                                width: 50.0,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: widget.color,
                                      image: widget.mostPopularArticles[index]
                                              .media.isNotEmpty
                                          ? DecorationImage(
                                              image: NetworkImage(widget
                                                  .mostPopularArticles[index]
                                                  .media[0]
                                                  .mediaMetadata[0]
                                                  .url))
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0,
                                        right: 8.0,
                                        bottom: 8.0,
                                        top: 8.0),
                                    child: Text(
                                      formatDetails(widget
                                          .mostPopularArticles[index].title),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4.0, bottom: 4.0),
                                    child: Text(
                                      formatDetails(widget
                                          .mostPopularArticles[index].details),
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.0),
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: AutoSizeText(
                                        " ${widget.mostPopularArticles[index].byLine}",
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[600],
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.date_range_rounded,
                                            color: widget.color,
                                            size: 10.0,
                                          ),
                                          AutoSizeText(
                                            " ${widget.mostPopularArticles[index].publishedDate}",
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[700],
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Center(
                                  child: Icon(
                                Icons.navigate_next,
                                size: 20.0,
                              )),
                            ),
                          ],
                        ),
                      ],
                    ), ////
                  ),
                ),
              ),
            );
          }),
    );
  }
}

String formatDetails(String text) {
  if (text.length >= 100) {
    text = "${text.substring(0, 101)}...";
  } else if (unitWidthValue < 370) {
    if (text.length >= 40) {
      text = "${text.substring(0, 35)}...";
    } else if (text.length >= 30) {
      text = "${text.substring(0, 30)}...";
    } else if (text.length >= 20) {
      text = "${text.substring(0, 20)}...";
    } else if (text.length >= 10) {
      text = "${text.substring(0, 10)}...";
    }
  }
  return text;
}

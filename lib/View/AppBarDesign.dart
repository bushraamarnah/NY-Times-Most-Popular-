import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

class AppBarDesign extends StatelessWidget {
  const AppBarDesign({
    super.key,
    required this.widget,
  });

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: [
        const Icon(Icons.search_rounded),
        PopupMenuButton(
          // add icon, by default "3 dot" icon
          // icon: Icon(Icons.book)
          itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("1"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("2"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("3"),
              ),
            ];
          },
        ),
      ],
    );
  }
}

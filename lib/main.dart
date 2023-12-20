import 'package:flutter/material.dart';
import 'View/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NY Times Most Popular Articles',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'NY Times Most Popular'),
        // '/detailView':(context) => const MyHomePage(title: 'NY Times Most Popular'),
      },
    );
  }
}

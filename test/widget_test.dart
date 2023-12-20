import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_http_client/fake_http_client.dart';
import 'package:ny_times_most_popular_articles/main.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  HttpOverrides.global = _MyHttpOverrides();
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}

class _MyHttpOverrides extends HttpOverrides {}

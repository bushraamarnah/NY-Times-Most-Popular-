import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_most_popular_articles/Helper/FetchData.dart';

// Mock your API service
class MockApiService extends Mock implements ApiService {}

void main() {
  group('MyApp widget test', () {
    testWidgets('MyApp builds and shows MyHomePage',
        (WidgetTester tester) async {
      // Mock the API service
      final MockApiService apiService = MockApiService();

      // Provide the mock service to your widget
      await tester.pumpWidget(
        MaterialApp(
          home: MyApp(apiService: apiService),
        ),
      );

      // Verify that MyApp builds correctly and shows MyHomePage
      expect(find.byType(MyHomePage), findsOneWidget);
    });

    // Add more tests as needed for specific behaviors or interactions with the app
  });
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({Key? key, required this.apiService}) : super(key: key);

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
        '/': (context) => MyHomePage(
              title: 'NY Times Most Popular',
              apiService: apiService,
            ),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final ApiService apiService;

  const MyHomePage({Key? key, required this.title, required this.apiService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Your HomePage widget implementation
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          // Your widget's UI implementation
          // This could include UI elements that interact with the API service
          ),
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'Constants.dart';

class API {
  static Future getAllData() {
    try {
      return http.get(Uri.parse(Constants.getAllData));
    } catch (E) {
      return Future<http.Response>.value();
    }
  }
}

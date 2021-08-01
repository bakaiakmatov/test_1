import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:test_1/model/cat.dart';

class WebService {
  static final WebService _singleton = WebService._internal();

  factory WebService() {
    return _singleton;
  }

  final _dio = Dio()..options.baseUrl = 'http://mobile-test.itfox-web.com:80/';

  WebService._internal();

  Future<void> signIn(String login, String password) async {
    try {
      final response = await _dio.post('public/testAuth',
          data: {'login': login, 'password': password});

      _dio.options.headers[HttpHeaders.authorizationHeader] =
          'Bearer ' + response.data['accessToken'];
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<List<Cat>> fetchCats() async {
    try {
      final response = await _dio.get('private/list?page=0');

      return catFromJson(response.data);
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}

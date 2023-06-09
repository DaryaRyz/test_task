import 'package:dio/dio.dart';

abstract class IDioClient {
  Future<Response> post(String url, {Map<String, dynamic>? body});

  Future<Response> get(String url, {Map<String, dynamic>? body});
}

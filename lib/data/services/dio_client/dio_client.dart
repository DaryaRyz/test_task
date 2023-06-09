import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task_flutter/data/services/api_exceptions.dart';
import 'package:test_task_flutter/data/services/dio_client/i_dio_client.dart';

@Injectable(as: IDioClient)
class DioClient implements IDioClient {
  final Dio _dio = Dio();

  @override
  Future<Response> post(String url, {Map<String, dynamic>? body}) async {
    try {
      return _dio.post(url, data: body);
    } catch (e) {
      throw ApiException('apiError'.tr(), body: e.toString());
    }
  }

  @override
  Future<Response> get(String url, {Map<String, dynamic>? body}) async {
    try {
      return _dio.get(url, queryParameters: body);
    } catch (e) {
      throw ApiException('apiError'.tr(), body: e.toString());
    }
  }
}

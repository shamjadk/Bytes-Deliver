import 'dart:developer';

import 'package:bytes_deliver/core/api_constants.dart';
import 'package:bytes_deliver/model/api_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static Future<List<ApiModel>?> getData() async {
    final dio = Dio();

    try {
      dio.options.headers['appid'] = ApiConstants.appId;
      FormData formData = FormData.fromMap({'page': 1});
      final response = await dio.post(ApiConstants.apiUrl, data: formData);
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        final producList = <ApiModel>[];
        for (final result in response.data['list']) {
          producList.add(ApiModel.fromJson(result));
        }
        return producList;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

import 'package:bytes_deliver/controller/services/api_service.dart';
import 'package:bytes_deliver/model/api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart';

@riverpod
class Api extends _$Api {
  @override
  void build() {}

  Future<List<ApiModel>?> getdata() async {
    return ApiServices.getData();
  }
}

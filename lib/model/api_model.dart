// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.g.dart';
part 'api_model.freezed.dart';


@freezed
class ApiModel with _$ApiModel {
    const factory ApiModel({
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "price")
        required int price,
        @JsonKey(name: "image")
        required String image,
        @JsonKey(name: "type")
        required String type,
    }) = _ApiModel;

    factory ApiModel.fromJson(Map<String, dynamic> json) => _$ApiModelFromJson(json);
}

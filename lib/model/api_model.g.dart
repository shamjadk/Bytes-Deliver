// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiModelImpl _$$ApiModelImplFromJson(Map<String, dynamic> json) =>
    _$ApiModelImpl(
      title: json['title'] as String,
      price: (json['price'] as num).toInt(),
      image: json['image'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$ApiModelImplToJson(_$ApiModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
      'type': instance.type,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gank_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GankItemEntity _$GankItemEntityFromJson(Map<String, dynamic> json) {
  return GankItemEntity(
      json['error'] as bool,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Result.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$GankItemEntityToJson(GankItemEntity instance) =>
    <String, dynamic>{'error': instance.error, 'results': instance.results};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['_id'] as String,
      json['createdAt'] as String,
      json['desc'] as String,
      json['publishedAt'] as String,
      json['source'] as String,
      json['type'] as String,
      json['url'] as String,
      json['used'] as bool,
      json['who'] as String,
      json['images'] == null
          ? null
          : (json['images'] as List).map((e) => e as String).toList());
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'desc': instance.desc,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
      'type': instance.type,
      'url': instance.url,
      'used': instance.used,
      'who': instance.who,
      'images': instance.images
    };

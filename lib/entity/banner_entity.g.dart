// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerEntity _$BannerEntityFromJson(Map<String, dynamic> json) {
  return BannerEntity((json['data'] as List)
      ?.map((e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$BannerEntityToJson(BannerEntity instance) =>
    <String, dynamic>{'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['id'] as int,
      json['name'] as String,
      json['commonTitle'] as String,
      json['imgUrl'] as String,
      json['imgUrlSize'] as String,
      json['bigImgTypeUrl'] as String,
      json['bigImgUrlSize'] as String,
      json['play'] as String,
      json['app'] as String,
      json['type'] as int,
      json['typeDesc'] as String,
      json['contentType'] as int,
      (json['standIdList'] as List)?.map((e) => e as int)?.toList(),
      json['startTime'] as int,
      json['endTime'] as int,
      json['level'] as int,
      json['newUser'] as int,
      json['closable'] as int,
      json['channelType'] as int,
      json['channelListMap'] == null
          ? null
          : ChannelListMap.fromJson(
              json['channelListMap'] as Map<String, dynamic>),
      json['businessName'] as String,
      json['businessIds'] as String,
      json['topicsId'] as int,
      json['mp4Url'] as String,
      json['resourceType'] as String,
      json['largeImgUrl'] as String,
      json['largeImgTone'] as String,
      json['largeAb'] as String,
      json['rankTrace'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'commonTitle': instance.commonTitle,
      'imgUrl': instance.imgUrl,
      'imgUrlSize': instance.imgUrlSize,
      'bigImgTypeUrl': instance.bigImgTypeUrl,
      'bigImgUrlSize': instance.bigImgUrlSize,
      'play': instance.play,
      'app': instance.app,
      'type': instance.type,
      'typeDesc': instance.typeDesc,
      'contentType': instance.contentType,
      'standIdList': instance.standIdList,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'level': instance.level,
      'newUser': instance.newUser,
      'closable': instance.closable,
      'channelType': instance.channelType,
      'channelListMap': instance.channelListMap,
      'businessName': instance.businessName,
      'businessIds': instance.businessIds,
      'topicsId': instance.topicsId,
      'mp4Url': instance.mp4Url,
      'resourceType': instance.resourceType,
      'largeImgUrl': instance.largeImgUrl,
      'largeImgTone': instance.largeImgTone,
      'largeAb': instance.largeAb,
      'rankTrace': instance.rankTrace,
      'url': instance.url
    };

ChannelListMap _$ChannelListMapFromJson(Map<String, dynamic> json) {
  return ChannelListMap();
}

Map<String, dynamic> _$ChannelListMapToJson(ChannelListMap instance) =>
    <String, dynamic>{};

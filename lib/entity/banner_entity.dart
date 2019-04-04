import 'package:json_annotation/json_annotation.dart';

part 'banner_entity.g.dart';

@JsonSerializable()
class BannerEntity extends Object {
  @JsonKey(name: 'data')
  List<Data> data;

  List<Data> get d => data;

  BannerEntity(
    this.data,
  );

  factory BannerEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$BannerEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerEntityToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'commonTitle')
  String commonTitle;

  @JsonKey(name: 'imgUrl')
  String imgUrl;

  @JsonKey(name: 'imgUrlSize')
  String imgUrlSize;

  @JsonKey(name: 'bigImgTypeUrl')
  String bigImgTypeUrl;

  @JsonKey(name: 'bigImgUrlSize')
  String bigImgUrlSize;

  @JsonKey(name: 'play')
  String play;

  @JsonKey(name: 'app')
  String app;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'typeDesc')
  String typeDesc;

  @JsonKey(name: 'contentType')
  int contentType;

  @JsonKey(name: 'standIdList')
  List<int> standIdList;

  @JsonKey(name: 'startTime')
  int startTime;

  @JsonKey(name: 'endTime')
  int endTime;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'newUser')
  int newUser;

  @JsonKey(name: 'closable')
  int closable;

  @JsonKey(name: 'channelType')
  int channelType;

  @JsonKey(name: 'channelListMap')
  ChannelListMap channelListMap;

  @JsonKey(name: 'businessName')
  String businessName;

  @JsonKey(name: 'businessIds')
  String businessIds;

  @JsonKey(name: 'topicsId')
  int topicsId;

  @JsonKey(name: 'mp4Url')
  String mp4Url;

  @JsonKey(name: 'resourceType')
  String resourceType;

  @JsonKey(name: 'largeImgUrl')
  String largeImgUrl;

  @JsonKey(name: 'largeImgTone')
  String largeImgTone;

  @JsonKey(name: 'largeAb')
  String largeAb;

  @JsonKey(name: 'rankTrace')
  String rankTrace;

  @JsonKey(name: 'url')
  String url;

  Data(
    this.id,
    this.name,
    this.commonTitle,
    this.imgUrl,
    this.imgUrlSize,
    this.bigImgTypeUrl,
    this.bigImgUrlSize,
    this.play,
    this.app,
    this.type,
    this.typeDesc,
    this.contentType,
    this.standIdList,
    this.startTime,
    this.endTime,
    this.level,
    this.newUser,
    this.closable,
    this.channelType,
    this.channelListMap,
    this.businessName,
    this.businessIds,
    this.topicsId,
    this.mp4Url,
    this.resourceType,
    this.largeImgUrl,
    this.largeImgTone,
    this.largeAb,
    this.rankTrace,
    this.url,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ChannelListMap extends Object {
  ChannelListMap();

  factory ChannelListMap.fromJson(Map<String, dynamic> srcJson) =>
      _$ChannelListMapFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChannelListMapToJson(this);
}

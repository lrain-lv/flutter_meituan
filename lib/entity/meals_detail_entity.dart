import 'package:json_annotation/json_annotation.dart';

part 'meals_detail_entity.g.dart';

@JsonSerializable()
class MealsDetailEntity extends Object {
  @JsonKey(name: 'stid')
  String stid;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'couponFoldThreshold')
  int couponFoldThreshold;

  @JsonKey(name: 'groupFoldThreshold')
  int groupFoldThreshold;

  @JsonKey(name: 'shikeFoldThreshold')
  int shikeFoldThreshold;

  @JsonKey(name: 'couponFoldTitle')
  String couponFoldTitle;

  @JsonKey(name: 'groupFoldTitle')
  String groupFoldTitle;

  @JsonKey(name: 'groupModuleTitle')
  String groupModuleTitle;

  @JsonKey(name: 'data')
  List<DataMeal> data;

  List<DataMeal> getData() {
    return data == null ? List() : data;
  }

  MealsDetailEntity(
    this.stid,
    this.count,
    this.couponFoldThreshold,
    this.groupFoldThreshold,
    this.shikeFoldThreshold,
    this.couponFoldTitle,
    this.groupFoldTitle,
    this.groupModuleTitle,
    this.data,
  );

  factory MealsDetailEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$MealsDetailEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MealsDetailEntityToJson(this);
}

@JsonSerializable()
class DataMeal extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'howuse')
  Howuse howuse;

  @JsonKey(name: 'cate')
  String cate;

  @JsonKey(name: 'brandname')
  String brandname;

  @JsonKey(name: 'range')
  String range;

  @JsonKey(name: 'mealcount')
  String mealcount;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'solds')
  double solds;

  @JsonKey(name: 'soldsDesc')
  String soldsDesc;

  @JsonKey(name: 'start')
  double start;

  @JsonKey(name: 'imgurl')
  String imgurl;

  @JsonKey(name: 'squareimgurl')
  String squareimgurl;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'value')
  double value;

  @JsonKey(name: 'deposit')
  double deposit;

  @JsonKey(name: 'optionalattrs')
  Optionalattrs optionalattrs;

  @JsonKey(name: 'isAvailableToday')
  bool isAvailableToday;

  @JsonKey(name: 'showtype')
  String showtype;

  @JsonKey(name: 'iUrl')
  String iUrl;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'taglist')
  List<Taglist> taglist;

  @JsonKey(name: 'shike')
  Shike shike;

  @JsonKey(name: 'campaigns')
  List<dynamic> campaigns;

  @JsonKey(name: 'biTuanTag')
  String biTuanTag;

  @JsonKey(name: 'typeLabel')
  TypeLabel typeLabel;

  DataMeal(
    this.id,
    this.slug,
    this.howuse,
    this.cate,
    this.brandname,
    this.range,
    this.mealcount,
    this.channel,
    this.solds,
    this.soldsDesc,
    this.start,
    this.imgurl,
    this.squareimgurl,
    this.price,
    this.value,
    this.deposit,
    this.optionalattrs,
    this.isAvailableToday,
    this.showtype,
    this.iUrl,
    this.title,
    this.taglist,
    this.shike,
    this.campaigns,
    this.biTuanTag,
    this.typeLabel,
  );

  factory DataMeal.fromJson(Map<String, dynamic> srcJson) =>
      _$DataMealFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataMealToJson(this);
}

@JsonSerializable()
class Howuse extends Object {
  @JsonKey(name: 'key')
  String key;

  Howuse(
    this.key,
  );

  factory Howuse.fromJson(Map<String, dynamic> srcJson) =>
      _$HowuseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HowuseToJson(this);
}

@JsonSerializable()
class Optionalattrs extends Object {
  @JsonKey(name: '11')
  String oneone;

  @JsonKey(name: '81')
  String eightone;

  Optionalattrs(
    this.oneone,
    this.eightone,
  );

  factory Optionalattrs.fromJson(Map<String, dynamic> srcJson) =>
      _$OptionalattrsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OptionalattrsToJson(this);
}

@JsonSerializable()
class Taglist extends Object {
  @JsonKey(name: 'name')
  String name;

  Taglist(
    this.name,
  );

  factory Taglist.fromJson(Map<String, dynamic> srcJson) =>
      _$TaglistFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TaglistToJson(this);
}

@JsonSerializable()
class Shike extends Object {
  Shike();

  factory Shike.fromJson(Map<String, dynamic> srcJson) =>
      _$ShikeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShikeToJson(this);
}

@JsonSerializable()
class TypeLabel extends Object {
  TypeLabel();

  factory TypeLabel.fromJson(Map<String, dynamic> srcJson) =>
      _$TypeLabelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TypeLabelToJson(this);
}

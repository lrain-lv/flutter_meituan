import 'package:json_annotation/json_annotation.dart';

part 'nearby_detail_recommend_entity.g.dart';

@JsonSerializable()
class NearbyDetailRecommendEntity extends Object {
  @JsonKey(name: 'data')
  DataDetail data;

  @JsonKey(name: 'serverInfo')
  ServerInfo serverInfo;
  @JsonKey(name: 'stid')
  String stid;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'stids')
  List<Stids> stids;

  NearbyDetailRecommendEntity(
    this.data,
    this.serverInfo,
    this.stid,
    this.title,
    this.stids,
  );

  factory NearbyDetailRecommendEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$NearbyDetailRecommendEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NearbyDetailRecommendEntityToJson(this);
}

@JsonSerializable()
class DataDetail extends Object {
  @JsonKey(name: 'catetab')
  List<Catetab> catetab;

  @JsonKey(name: 'deals')
  List<Deals> deals;

  List<Deals> getDeals() {
    return deals == null ? List() : deals;
  }

  DataDetail(
    this.catetab,
    this.deals,
  );

  factory DataDetail.fromJson(Map<String, dynamic> srcJson) =>
      _$DataDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataDetailToJson(this);
}

@JsonSerializable()
class Catetab extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'parentId')
  int parentId;

  Catetab(
    this.name,
    this.id,
    this.parentId,
  );

  factory Catetab.fromJson(Map<String, dynamic> srcJson) =>
      _$CatetabFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CatetabToJson(this);
}

@JsonSerializable()
class Deals extends Object {
  @JsonKey(name: 'poiids')
  List<dynamic> poiids;

  @JsonKey(name: 'mealcount')
  String mealcount;

  @JsonKey(name: 'pricecalendar')
  List<Pricecalendar> pricecalendar;

  @JsonKey(name: 'rating')
  double rating;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'range')
  String range;

  @JsonKey(name: 'optionalattrs')
  Optionalattrs optionalattrs;

  @JsonKey(name: 'couponendtime')
  int couponendtime;

  @JsonKey(name: 'mname')
  String mname;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'brandname')
  String brandname;

  @JsonKey(name: 'dt')
  int dt;

  @JsonKey(name: 'imgurl')
  String imgurl;

  @JsonKey(name: 'rate-count')
  int ratecount;

  @JsonKey(name: 'mlls')
  String mlls;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'solds')
  int solds;

  @JsonKey(name: 'digestion')
  String digestion;

  @JsonKey(name: 'end')
  int end;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'state')
  int state;

  @JsonKey(name: 'value')
  int value;

  @JsonKey(name: 'nobooking')
  int nobooking;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'squareimgurl')
  String squareimgurl;

  @JsonKey(name: 'mtitle')
  String mtitle;

  @JsonKey(name: 'smstitle')
  String smstitle;

  @JsonKey(name: 'festcanuse')
  int festcanuse;

  @JsonKey(name: 'isAvailableToday')
  bool isAvailableToday;

  @JsonKey(name: 'cate')
  String cate;

  @JsonKey(name: 'couponbegintime')
  int couponbegintime;

  @JsonKey(name: 'frontPoiCates')
  String frontPoiCates;

  @JsonKey(name: 'subcate')
  String subcate;

  @JsonKey(name: 'start')
  int start;

  @JsonKey(name: 'dtype')
  int dtype;

  @JsonKey(name: 'bookinginfo')
  String bookinginfo;

  @JsonKey(name: 'titleTag')
  TitleTag titleTag;

  @JsonKey(name: 'showtype')
  String showtype;

  @JsonKey(name: 'satisfaction')
  int satisfaction;

  @JsonKey(name: 'hide')
  int hide;

  @JsonKey(name: 'ctype')
  int ctype;

  @JsonKey(name: 'applelottery')
  int applelottery;

  @JsonKey(name: 'deposit')
  int deposit;

  @JsonKey(name: 'attrJson')
  List<AttrJson> attrJson;

  @JsonKey(name: 'status')
  int status;

  Deals(
    this.poiids,
    this.mealcount,
    this.pricecalendar,
    this.rating,
    this.channel,
    this.range,
    this.optionalattrs,
    this.couponendtime,
    this.mname,
    this.title,
    this.brandname,
    this.dt,
    this.imgurl,
    this.ratecount,
    this.mlls,
    this.price,
    this.solds,
    this.digestion,
    this.end,
    this.id,
    this.state,
    this.value,
    this.nobooking,
    this.slug,
    this.squareimgurl,
    this.mtitle,
    this.smstitle,
    this.festcanuse,
    this.isAvailableToday,
    this.cate,
    this.couponbegintime,
    this.frontPoiCates,
    this.subcate,
    this.start,
    this.dtype,
    this.bookinginfo,
    this.titleTag,
    this.showtype,
    this.satisfaction,
    this.hide,
    this.ctype,
    this.applelottery,
    this.deposit,
    this.attrJson,
    this.status,
  );

  factory Deals.fromJson(Map<String, dynamic> srcJson) =>
      _$DealsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DealsToJson(this);
}

@JsonSerializable()
class Pricecalendar extends Object {
  @JsonKey(name: 'buyprice')
  int buyprice;

  @JsonKey(name: 'dealid')
  int dealid;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'range')
  List<dynamic> range;

  @JsonKey(name: 'endtime')
  int endtime;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'starttime')
  int starttime;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'desc')
  String desc;

  Pricecalendar(
    this.buyprice,
    this.dealid,
    this.price,
    this.range,
    this.endtime,
    this.id,
    this.starttime,
    this.type,
    this.desc,
  );

  factory Pricecalendar.fromJson(Map<String, dynamic> srcJson) =>
      _$PricecalendarFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PricecalendarToJson(this);
}

@JsonSerializable()
class Optionalattrs extends Object {
  @JsonKey(name: '11')
  String oneone;

  @JsonKey(name: '81')
  String etightone;

  Optionalattrs(
    this.oneone,
    this.etightone,
  );

  factory Optionalattrs.fromJson(Map<String, dynamic> srcJson) =>
      _$OptionalattrsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OptionalattrsToJson(this);
}

@JsonSerializable()
class TitleTag extends Object {
  TitleTag();

  factory TitleTag.fromJson(Map<String, dynamic> srcJson) =>
      _$TitleTagFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TitleTagToJson(this);
}

@JsonSerializable()
class AttrJson extends Object {
  @JsonKey(name: 'iconname')
  String iconname;

  @JsonKey(name: 'key')
  int key;

  @JsonKey(name: 'status')
  int status;

  AttrJson(
    this.iconname,
    this.key,
    this.status,
  );

  factory AttrJson.fromJson(Map<String, dynamic> srcJson) =>
      _$AttrJsonFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AttrJsonToJson(this);
}

@JsonSerializable()
class ServerInfo extends Object {
  @JsonKey(name: 'traceId')
  String traceId;

  ServerInfo(
    this.traceId,
  );

  factory ServerInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$ServerInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ServerInfoToJson(this);
}

@JsonSerializable()
class Stids extends Object {
  @JsonKey(name: 'dealid')
  int dealid;

  @JsonKey(name: 'stid')
  String stid;

  Stids(
    this.dealid,
    this.stid,
  );

  factory Stids.fromJson(Map<String, dynamic> srcJson) =>
      _$StidsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StidsToJson(this);
}

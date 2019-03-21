import 'package:json_annotation/json_annotation.dart';

part 'recommend_entity.g.dart';


@JsonSerializable()
class RecommendEntity extends Object {

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'ct_poi')
  String ctPoi;

  @JsonKey(name: 'data')
  List<Data2> data;

  @JsonKey(name: 'ct_pois')
  List<Ct_pois> ctPois;

  @JsonKey(name: 'serverInfo')
  ServerInfo serverInfo;

  List<Data2> getData2(){
    return data == null ? new List():data;
  }

  RecommendEntity(this.count,this.ctPoi,this.data,this.ctPois,this.serverInfo,);

  factory RecommendEntity.fromJson(Map<String, dynamic> srcJson) => _$RecommendEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendEntityToJson(this);

}


@JsonSerializable()
class Data2 extends Object {

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'latestWeekCoupon')
  int latestWeekCoupon;

  @JsonKey(name: 'payInfo')
  PayInfo payInfo;

  @JsonKey(name: 'cityId')
  int cityId;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'addr')
  String addr;

  @JsonKey(name: 'ktvAppointStatus')
  int ktvAppointStatus;

  @JsonKey(name: 'brandName')
  String brandName;

  @JsonKey(name: 'brandId')
  int brandId;

  @JsonKey(name: 'isSuperVoucher')
  int isSuperVoucher;

  @JsonKey(name: 'poiid')
  String poiid;

  @JsonKey(name: 'groupInfo')
  int groupInfo;

  @JsonKey(name: 'showType')
  String showType;

  @JsonKey(name: 'bizloginid')
  int bizloginid;

  @JsonKey(name: 'parkingInfo')
  String parkingInfo;

  @JsonKey(name: 'brandLogo')
  String brandLogo;

  @JsonKey(name: 'extra')
  Extra extra;

  @JsonKey(name: 'preTags')
  List<dynamic> preTags;

  @JsonKey(name: 'isSnack')
  bool isSnack;

  @JsonKey(name: 'discount')
  String discount;

  @JsonKey(name: 'frontImg')
  String frontImg;

  @JsonKey(name: 'historyCouponCount')
  int historyCouponCount;

  @JsonKey(name: 'avgPrice')
  int avgPrice;

  @JsonKey(name: 'floor')
  String floor;

  @JsonKey(name: 'avgScore')
  double avgScore;

  @JsonKey(name: 'dayRoomSpan')
  int dayRoomSpan;

  @JsonKey(name: 'lowestPrice')
  int lowestPrice;

  @JsonKey(name: 'introduction')
  String introduction;

  @JsonKey(name: 'isExclusive')
  bool isExclusive;

  @JsonKey(name: 'payAbstracts')
  List<PayAbstracts> payAbstracts;

  @JsonKey(name: 'markNumbers')
  int markNumbers;

  @JsonKey(name: 'lng')
  double lng;

  @JsonKey(name: 'areaId')
  int areaId;

  @JsonKey(name: 'subwayStationId')
  String subwayStationId;

  @JsonKey(name: 'preferent')
  bool preferent;

  @JsonKey(name: 'campaignTag')
  String campaignTag;

  @JsonKey(name: 'isSupportAppointment')
  bool isSupportAppointment;

  @JsonKey(name: 'referencePrice')
  int referencePrice;

  @JsonKey(name: 'style')
  String style;

  @JsonKey(name: 'featureMenus')
  String featureMenus;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hourRoomSpan')
  int hourRoomSpan;

  @JsonKey(name: 'notice')
  String notice;

  @JsonKey(name: 'lat')
  double lat;

  @JsonKey(name: 'isWaimai')
  int isWaimai;

  @JsonKey(name: 'ktvLowestPrice')
  int ktvLowestPrice;

  @JsonKey(name: 'isHot')
  int isHot;

  @JsonKey(name: 'mallId')
  int mallId;

  @JsonKey(name: 'hasGroup')
  bool hasGroup;

  @JsonKey(name: 'cates')
  String cates;

  @JsonKey(name: 'zlSourceType')
  int zlSourceType;

  @JsonKey(name: 'chooseSitting')
  bool chooseSitting;

  @JsonKey(name: 'isImax')
  bool isImax;

  @JsonKey(name: 'wifi')
  bool wifi;

  @JsonKey(name: 'ktv')
  Ktv ktv;

  @JsonKey(name: 'abstracts')
  Abstracts abstracts;

  @JsonKey(name: 'allowRefund')
  int allowRefund;

  @JsonKey(name: 'areaName')
  String areaName;

  @JsonKey(name: 'iUrl')
  String iUrl;

  @JsonKey(name: 'openInfo')
  String openInfo;

  @JsonKey(name: 'isQueuing')
  int isQueuing;

  @JsonKey(name: 'tour')
  Tour tour;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'cateId')
  int cateId;

  @JsonKey(name: 'hallTypes')
  List<dynamic> hallTypes;

  @JsonKey(name: 'cateName')
  String cateName;

  Data2(this.phone,this.latestWeekCoupon,this.payInfo,this.cityId,this.location,this.addr,this.ktvAppointStatus,this.brandName,this.brandId,this.isSuperVoucher,this.poiid,this.groupInfo,this.showType,this.bizloginid,this.parkingInfo,this.brandLogo,this.extra,this.preTags,this.isSnack,this.discount,this.frontImg,this.historyCouponCount,this.avgPrice,this.floor,this.avgScore,this.dayRoomSpan,this.lowestPrice,this.introduction,this.isExclusive,this.payAbstracts,this.markNumbers,this.lng,this.areaId,this.subwayStationId,this.preferent,this.campaignTag,this.isSupportAppointment,this.referencePrice,this.style,this.featureMenus,this.name,this.hourRoomSpan,this.notice,this.lat,this.isWaimai,this.ktvLowestPrice,this.isHot,this.mallId,this.hasGroup,this.cates,this.zlSourceType,this.chooseSitting,this.isImax,this.wifi,this.ktv,this.abstracts,this.allowRefund,this.areaName,this.iUrl,this.openInfo,this.isQueuing,this.tour,this.channel,this.cateId,this.hallTypes,this.cateName,);

  factory Data2.fromJson(Map<String, dynamic> srcJson) => _$Data2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Data2ToJson(this);

}


@JsonSerializable()
class PayInfo extends Object {

  PayInfo();

  factory PayInfo.fromJson(Map<String, dynamic> srcJson) => _$PayInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PayInfoToJson(this);

}


@JsonSerializable()
class Extra extends Object {

  @JsonKey(name: 'icons')
  List<dynamic> icons;

  Extra(this.icons,);

  factory Extra.fromJson(Map<String, dynamic> srcJson) => _$ExtraFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExtraToJson(this);

}


@JsonSerializable()
class PayAbstracts extends Object {

  @JsonKey(name: 'abstract')
  String abstract;

  @JsonKey(name: 'icon_url')
  String iconUrl;

  @JsonKey(name: 'type')
  String type;

  PayAbstracts(this.abstract,this.iconUrl,this.type,);

  factory PayAbstracts.fromJson(Map<String, dynamic> srcJson) => _$PayAbstractsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PayAbstractsToJson(this);

}


@JsonSerializable()
class Ktv extends Object {

  @JsonKey(name: 'ktvPromotionMsg')
  String ktvPromotionMsg;

  @JsonKey(name: 'ktvIUrl')
  String ktvIUrl;

  @JsonKey(name: 'ktvLowestPrice')
  int ktvLowestPrice;

  @JsonKey(name: 'ktvIconURL')
  String ktvIconURL;

  @JsonKey(name: 'tips')
  String tips;

  @JsonKey(name: 'ktvAppointStatus')
  int ktvAppointStatus;

  @JsonKey(name: 'ktvAbstracts')
  List<dynamic> ktvAbstracts;

  Ktv(this.ktvPromotionMsg,this.ktvIUrl,this.ktvLowestPrice,this.ktvIconURL,this.tips,this.ktvAppointStatus,this.ktvAbstracts,);

  factory Ktv.fromJson(Map<String, dynamic> srcJson) => _$KtvFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KtvToJson(this);

}


@JsonSerializable()
class Abstracts extends Object {

  @JsonKey(name: 'group')
  String group;

  @JsonKey(name: 'coupon')
  String coupon;

  Abstracts(this.group,this.coupon,);

  factory Abstracts.fromJson(Map<String, dynamic> srcJson) => _$AbstractsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AbstractsToJson(this);

}


@JsonSerializable()
class Tour extends Object {

  @JsonKey(name: 'tourPlaceName')
  String tourPlaceName;

  @JsonKey(name: 'tourInfo')
  String tourInfo;

  @JsonKey(name: 'tourDetailDesc')
  String tourDetailDesc;

  @JsonKey(name: 'tourOpenTime')
  String tourOpenTime;

  @JsonKey(name: 'tourMarketPrice')
  int tourMarketPrice;

  @JsonKey(name: 'tourPlaceStar')
  String tourPlaceStar;

  Tour(this.tourPlaceName,this.tourInfo,this.tourDetailDesc,this.tourOpenTime,this.tourMarketPrice,this.tourPlaceStar,);

  factory Tour.fromJson(Map<String, dynamic> srcJson) => _$TourFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TourToJson(this);

}


@JsonSerializable()
class Ct_pois extends Object {

  @JsonKey(name: 'poiid')
  int poiid;

  @JsonKey(name: 'ct_poi')
  String ctPoi;

  Ct_pois(this.poiid,this.ctPoi,);

  factory Ct_pois.fromJson(Map<String, dynamic> srcJson) => _$Ct_poisFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Ct_poisToJson(this);

}


@JsonSerializable()
class ServerInfo extends Object {

  @JsonKey(name: 'traceId')
  String traceId;

  ServerInfo(this.traceId,);

  factory ServerInfo.fromJson(Map<String, dynamic> srcJson) => _$ServerInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ServerInfoToJson(this);

}



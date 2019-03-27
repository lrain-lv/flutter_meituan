//// GENERATED CODE - DO NOT MODIFY BY HAND
//
//part of 'nearby_recommend_entity.dart';
//
//// **************************************************************************
//// JsonSerializableGenerator
//// **************************************************************************
//
//NearbyRecommendEntity _$NearbyRecommendEntityFromJson(
//    Map<String, dynamic> json) {
//  return NearbyRecommendEntity(
//      json['count'] as int,
//      json['ct_poi'] as String,
//      (json['data'] as List)
//          ?.map((e) =>
//              e == null ? null : DataNearby.fromJson(e as Map<String, dynamic>))
//          ?.toList(),
//      (json['ct_pois'] as List)
//          ?.map((e) =>
//              e == null ? null : Ct_pois.fromJson(e as Map<String, dynamic>))
//          ?.toList(),
//      json['serverInfo'] == null
//          ? null
//          : ServerInfo.fromJson(json['serverInfo'] as Map<String, dynamic>));
//}
//
//Map<String, dynamic> _$NearbyRecommendEntityToJson(
//        NearbyRecommendEntity instance) =>
//    <String, dynamic>{
//      'count': instance.count,
//      'ct_poi': instance.ctPoi,
//      'data': instance.data,
//      'ct_pois': instance.ctPois,
//      'serverInfo': instance.serverInfo
//    };
//
//DataNearby _$DataNearbyFromJson(Map<String, dynamic> json) {
//  return DataNearby(
//      json['phone'] as String,
//      json['latestWeekCoupon'] as int,
//      json['payInfo'] == null
//          ? null
//          : PayInfo.fromJson(json['payInfo'] as Map<String, dynamic>),
//      json['cityId'] as int,
//      json['location'] as String,
//      json['addr'] as String,
//      json['ktvAppointStatus'] as int,
//      json['brandName'] as String,
//      json['brandId'] as int,
//      json['isSuperVoucher'] as int,
//      json['poiid'] as String,
//      json['groupInfo'] as int,
//      json['showType'] as String,
//      json['bizloginid'] as int,
//      json['parkingInfo'] as String,
//      json['brandLogo'] as String,
//      json['extra'] == null
//          ? null
//          : Extra.fromJson(json['extra'] as Map<String, dynamic>),
//      json['preTags'] as List,
//      json['isSnack'] as bool,
//      json['discount'] as String,
//      json['frontImg'] as String,
//      json['historyCouponCount'] as int,
//      json['avgPrice'] as int,
//      json['floor'] as String,
//      (json['avgScore'] as num)?.toDouble(),
//      json['dayRoomSpan'] as int,
//      (json['lowestPrice'] as num)?.toDouble(),
//      json['introduction'] as String,
//      json['isExclusive'] as bool,
//      (json['payAbstracts'] as List)
//          ?.map((e) => e == null
//              ? null
//              : PayAbstracts.fromJson(e as Map<String, dynamic>))
//          ?.toList(),
//      json['markNumbers'] as int,
//      (json['lng'] as num)?.toDouble(),
//      json['areaId'] as int,
//      json['subwayStationId'] as String,
//      json['preferent'] as bool,
//      json['campaignTag'] as String,
//      json['isSupportAppointment'] as bool,
//      json['referencePrice'] as int,
//      json['style'] as String,
//      json['featureMenus'] as String,
//      json['name'] as String,
//      json['hourRoomSpan'] as int,
//      json['notice'] as String,
//      (json['lat'] as num)?.toDouble(),
//      json['isWaimai'] as int,
//      json['ktvLowestPrice'] as int,
//      json['isHot'] as int,
//      json['mallId'] as int,
//      json['hasGroup'] as bool,
//      json['cates'] as String,
//      json['zlSourceType'] as int,
//      json['chooseSitting'] as bool,
//      json['isImax'] as bool,
//      json['wifi'] as bool,
//      json['ktv'] == null
//          ? null
//          : Ktv.fromJson(json['ktv'] as Map<String, dynamic>),
//      json['abstracts'] == null
//          ? null
//          : Abstracts.fromJson(json['abstracts'] as Map<String, dynamic>),
//      json['allowRefund'] as int,
//      json['areaName'] as String,
//      json['iUrl'] as String,
//      json['openInfo'] as String,
//      json['isQueuing'] as int,
//      json['tour'] == null
//          ? null
//          : Tour.fromJson(json['tour'] as Map<String, dynamic>),
//      json['channel'] as String,
//      json['cateId'] as int,
//      json['hallTypes'] as List,
//      json['cateName'] as String);
//}
//
//Map<String, dynamic> _$DataNearbyToJson(DataNearby instance) =>
//    <String, dynamic>{
//      'phone': instance.phone,
//      'latestWeekCoupon': instance.latestWeekCoupon,
//      'payInfo': instance.payInfo,
//      'cityId': instance.cityId,
//      'location': instance.location,
//      'addr': instance.addr,
//      'ktvAppointStatus': instance.ktvAppointStatus,
//      'brandName': instance.brandName,
//      'brandId': instance.brandId,
//      'isSuperVoucher': instance.isSuperVoucher,
//      'poiid': instance.poiid,
//      'groupInfo': instance.groupInfo,
//      'showType': instance.showType,
//      'bizloginid': instance.bizloginid,
//      'parkingInfo': instance.parkingInfo,
//      'brandLogo': instance.brandLogo,
//      'extra': instance.extra,
//      'preTags': instance.preTags,
//      'isSnack': instance.isSnack,
//      'discount': instance.discount,
//      'frontImg': instance.frontImg,
//      'historyCouponCount': instance.historyCouponCount,
//      'avgPrice': instance.avgPrice,
//      'floor': instance.floor,
//      'avgScore': instance.avgScore,
//      'dayRoomSpan': instance.dayRoomSpan,
//      'lowestPrice': instance.lowestPrice,
//      'introduction': instance.introduction,
//      'isExclusive': instance.isExclusive,
//      'payAbstracts': instance.payAbstracts,
//      'markNumbers': instance.markNumbers,
//      'lng': instance.lng,
//      'areaId': instance.areaId,
//      'subwayStationId': instance.subwayStationId,
//      'preferent': instance.preferent,
//      'campaignTag': instance.campaignTag,
//      'isSupportAppointment': instance.isSupportAppointment,
//      'referencePrice': instance.referencePrice,
//      'style': instance.style,
//      'featureMenus': instance.featureMenus,
//      'name': instance.name,
//      'hourRoomSpan': instance.hourRoomSpan,
//      'notice': instance.notice,
//      'lat': instance.lat,
//      'isWaimai': instance.isWaimai,
//      'ktvLowestPrice': instance.ktvLowestPrice,
//      'isHot': instance.isHot,
//      'mallId': instance.mallId,
//      'hasGroup': instance.hasGroup,
//      'cates': instance.cates,
//      'zlSourceType': instance.zlSourceType,
//      'chooseSitting': instance.chooseSitting,
//      'isImax': instance.isImax,
//      'wifi': instance.wifi,
//      'ktv': instance.ktv,
//      'abstracts': instance.abstracts,
//      'allowRefund': instance.allowRefund,
//      'areaName': instance.areaName,
//      'iUrl': instance.iUrl,
//      'openInfo': instance.openInfo,
//      'isQueuing': instance.isQueuing,
//      'tour': instance.tour,
//      'channel': instance.channel,
//      'cateId': instance.cateId,
//      'hallTypes': instance.hallTypes,
//      'cateName': instance.cateName
//    };
//
//PayInfo _$PayInfoFromJson(Map<String, dynamic> json) {
//  return PayInfo();
//}
//
//Map<String, dynamic> _$PayInfoToJson(PayInfo instance) => <String, dynamic>{};
//
//Extra _$ExtraFromJson(Map<String, dynamic> json) {
//  return Extra(json['icons'] as List);
//}
//
//Map<String, dynamic> _$ExtraToJson(Extra instance) =>
//    <String, dynamic>{'icons': instance.icons};
//
//PayAbstracts _$PayAbstractsFromJson(Map<String, dynamic> json) {
//  return PayAbstracts(json['abstract'] as String, json['icon_url'] as String,
//      json['type'] as String);
//}
//
//Map<String, dynamic> _$PayAbstractsToJson(PayAbstracts instance) =>
//    <String, dynamic>{
//      'abstract': instance.abstract,
//      'icon_url': instance.iconUrl,
//      'type': instance.type
//    };
//
//Ktv _$KtvFromJson(Map<String, dynamic> json) {
//  return Ktv(
//      json['ktvPromotionMsg'] as String,
//      json['ktvIUrl'] as String,
//      json['ktvLowestPrice'] as int,
//      json['ktvIconURL'] as String,
//      json['tips'] as String,
//      json['ktvAppointStatus'] as int,
//      json['ktvAbstracts'] as List);
//}
//
//Map<String, dynamic> _$KtvToJson(Ktv instance) => <String, dynamic>{
//      'ktvPromotionMsg': instance.ktvPromotionMsg,
//      'ktvIUrl': instance.ktvIUrl,
//      'ktvLowestPrice': instance.ktvLowestPrice,
//      'ktvIconURL': instance.ktvIconURL,
//      'tips': instance.tips,
//      'ktvAppointStatus': instance.ktvAppointStatus,
//      'ktvAbstracts': instance.ktvAbstracts
//    };
//
//Abstracts _$AbstractsFromJson(Map<String, dynamic> json) {
//  return Abstracts(json['group'] as String, json['coupon'] as String);
//}
//
//Map<String, dynamic> _$AbstractsToJson(Abstracts instance) =>
//    <String, dynamic>{'group': instance.group, 'coupon': instance.coupon};
//
//Tour _$TourFromJson(Map<String, dynamic> json) {
//  return Tour(
//      json['tourPlaceName'] as String,
//      json['tourInfo'] as String,
//      json['tourDetailDesc'] as String,
//      json['tourOpenTime'] as String,
//      json['tourMarketPrice'] as int,
//      json['tourPlaceStar'] as String);
//}
//
//Map<String, dynamic> _$TourToJson(Tour instance) => <String, dynamic>{
//      'tourPlaceName': instance.tourPlaceName,
//      'tourInfo': instance.tourInfo,
//      'tourDetailDesc': instance.tourDetailDesc,
//      'tourOpenTime': instance.tourOpenTime,
//      'tourMarketPrice': instance.tourMarketPrice,
//      'tourPlaceStar': instance.tourPlaceStar
//    };
//
//Ct_pois _$Ct_poisFromJson(Map<String, dynamic> json) {
//  return Ct_pois(json['poiid'] as int, json['ct_poi'] as String);
//}
//
//Map<String, dynamic> _$Ct_poisToJson(Ct_pois instance) =>
//    <String, dynamic>{'poiid': instance.poiid, 'ct_poi': instance.ctPoi};
//
//ServerInfo _$ServerInfoFromJson(Map<String, dynamic> json) {
//  return ServerInfo(json['traceId'] as String);
//}
//
//Map<String, dynamic> _$ServerInfoToJson(ServerInfo instance) =>
//    <String, dynamic>{'traceId': instance.traceId};

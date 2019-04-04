// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_detail_recommend_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyDetailRecommendEntity _$NearbyDetailRecommendEntityFromJson(
    Map<String, dynamic> json) {
  return NearbyDetailRecommendEntity(
      json['data'] == null
          ? null
          : DataDetail.fromJson(json['data'] as Map<String, dynamic>),
      json['serverInfo'] == null
          ? null
          : ServerInfo.fromJson(json['serverInfo'] as Map<String, dynamic>),
      json['stid'] as String,
      json['title'] as String,
      (json['stids'] as List)
          ?.map((e) =>
              e == null ? null : Stids.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NearbyDetailRecommendEntityToJson(
        NearbyDetailRecommendEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'serverInfo': instance.serverInfo,
      'stid': instance.stid,
      'title': instance.title,
      'stids': instance.stids
    };

DataDetail _$DataDetailFromJson(Map<String, dynamic> json) {
  return DataDetail(
      (json['catetab'] as List)
          ?.map((e) =>
              e == null ? null : Catetab.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['deals'] as List)
          ?.map((e) =>
              e == null ? null : Deals.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataDetailToJson(DataDetail instance) =>
    <String, dynamic>{'catetab': instance.catetab, 'deals': instance.deals};

Catetab _$CatetabFromJson(Map<String, dynamic> json) {
  return Catetab(
      json['name'] as String, json['id'] as int, json['parentId'] as int);
}

Map<String, dynamic> _$CatetabToJson(Catetab instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'parentId': instance.parentId
    };

Deals _$DealsFromJson(Map<String, dynamic> json) {
  return Deals(
      json['poiids'] as List,
      json['mealcount'] as String,
      (json['pricecalendar'] as List)
          ?.map((e) => e == null
              ? null
              : Pricecalendar.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['rating'] as num)?.toDouble(),
      json['channel'] as String,
      json['range'] as String,
      json['optionalattrs'] == null
          ? null
          : Optionalattrs.fromJson(
              json['optionalattrs'] as Map<String, dynamic>),
      json['couponendtime'] as int,
      json['mname'] as String,
      json['title'] as String,
      json['brandname'] as String,
      json['dt'] as int,
      json['imgurl'] as String,
      json['rate-count'] as int,
      json['mlls'] as String,
      json['price'] as int,
      json['solds'] as int,
      json['digestion'] as String,
      json['end'] as int,
      json['id'] as int,
      json['state'] as int,
      json['value'] as int,
      json['nobooking'] as int,
      json['slug'] as String,
      json['squareimgurl'] as String,
      json['mtitle'] as String,
      json['smstitle'] as String,
      json['festcanuse'] as int,
      json['isAvailableToday'] as bool,
      json['cate'] as String,
      json['couponbegintime'] as int,
      json['frontPoiCates'] as String,
      json['subcate'] as String,
      json['start'] as int,
      json['dtype'] as int,
      json['bookinginfo'] as String,
      json['titleTag'] == null
          ? null
          : TitleTag.fromJson(json['titleTag'] as Map<String, dynamic>),
      json['showtype'] as String,
      json['satisfaction'] as int,
      json['hide'] as int,
      json['ctype'] as int,
      json['applelottery'] as int,
      json['deposit'] as int,
      (json['attrJson'] as List)
          ?.map((e) =>
              e == null ? null : AttrJson.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['status'] as int);
}

Map<String, dynamic> _$DealsToJson(Deals instance) => <String, dynamic>{
      'poiids': instance.poiids,
      'mealcount': instance.mealcount,
      'pricecalendar': instance.pricecalendar,
      'rating': instance.rating,
      'channel': instance.channel,
      'range': instance.range,
      'optionalattrs': instance.optionalattrs,
      'couponendtime': instance.couponendtime,
      'mname': instance.mname,
      'title': instance.title,
      'brandname': instance.brandname,
      'dt': instance.dt,
      'imgurl': instance.imgurl,
      'rate-count': instance.ratecount,
      'mlls': instance.mlls,
      'price': instance.price,
      'solds': instance.solds,
      'digestion': instance.digestion,
      'end': instance.end,
      'id': instance.id,
      'state': instance.state,
      'value': instance.value,
      'nobooking': instance.nobooking,
      'slug': instance.slug,
      'squareimgurl': instance.squareimgurl,
      'mtitle': instance.mtitle,
      'smstitle': instance.smstitle,
      'festcanuse': instance.festcanuse,
      'isAvailableToday': instance.isAvailableToday,
      'cate': instance.cate,
      'couponbegintime': instance.couponbegintime,
      'frontPoiCates': instance.frontPoiCates,
      'subcate': instance.subcate,
      'start': instance.start,
      'dtype': instance.dtype,
      'bookinginfo': instance.bookinginfo,
      'titleTag': instance.titleTag,
      'showtype': instance.showtype,
      'satisfaction': instance.satisfaction,
      'hide': instance.hide,
      'ctype': instance.ctype,
      'applelottery': instance.applelottery,
      'deposit': instance.deposit,
      'attrJson': instance.attrJson,
      'status': instance.status
    };

Pricecalendar _$PricecalendarFromJson(Map<String, dynamic> json) {
  return Pricecalendar(
      json['buyprice'] as int,
      json['dealid'] as int,
      json['price'] as int,
      json['range'] as List,
      json['endtime'] as int,
      json['id'] as int,
      json['starttime'] as int,
      json['type'] as int,
      json['desc'] as String);
}

Map<String, dynamic> _$PricecalendarToJson(Pricecalendar instance) =>
    <String, dynamic>{
      'buyprice': instance.buyprice,
      'dealid': instance.dealid,
      'price': instance.price,
      'range': instance.range,
      'endtime': instance.endtime,
      'id': instance.id,
      'starttime': instance.starttime,
      'type': instance.type,
      'desc': instance.desc
    };

Optionalattrs _$OptionalattrsFromJson(Map<String, dynamic> json) {
  return Optionalattrs(json['11'] as String, json['81'] as String);
}

Map<String, dynamic> _$OptionalattrsToJson(Optionalattrs instance) =>
    <String, dynamic>{'11': instance.oneone, '81': instance.etightone};

TitleTag _$TitleTagFromJson(Map<String, dynamic> json) {
  return TitleTag();
}

Map<String, dynamic> _$TitleTagToJson(TitleTag instance) => <String, dynamic>{};

AttrJson _$AttrJsonFromJson(Map<String, dynamic> json) {
  return AttrJson(
      json['iconname'] as String, json['key'] as int, json['status'] as int);
}

Map<String, dynamic> _$AttrJsonToJson(AttrJson instance) => <String, dynamic>{
      'iconname': instance.iconname,
      'key': instance.key,
      'status': instance.status
    };

ServerInfo _$ServerInfoFromJson(Map<String, dynamic> json) {
  return ServerInfo(json['traceId'] as String);
}

Map<String, dynamic> _$ServerInfoToJson(ServerInfo instance) =>
    <String, dynamic>{'traceId': instance.traceId};

Stids _$StidsFromJson(Map<String, dynamic> json) {
  return Stids(json['dealid'] as int, json['stid'] as String);
}

Map<String, dynamic> _$StidsToJson(Stids instance) =>
    <String, dynamic>{'dealid': instance.dealid, 'stid': instance.stid};

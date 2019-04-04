// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsDetailEntity _$MealsDetailEntityFromJson(Map<String, dynamic> json) {
  return MealsDetailEntity(
      json['stid'] as String,
      json['count'] as int,
      json['couponFoldThreshold'] as int,
      json['groupFoldThreshold'] as int,
      json['shikeFoldThreshold'] as int,
      json['couponFoldTitle'] as String,
      json['groupFoldTitle'] as String,
      json['groupModuleTitle'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : DataMeal.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MealsDetailEntityToJson(MealsDetailEntity instance) =>
    <String, dynamic>{
      'stid': instance.stid,
      'count': instance.count,
      'couponFoldThreshold': instance.couponFoldThreshold,
      'groupFoldThreshold': instance.groupFoldThreshold,
      'shikeFoldThreshold': instance.shikeFoldThreshold,
      'couponFoldTitle': instance.couponFoldTitle,
      'groupFoldTitle': instance.groupFoldTitle,
      'groupModuleTitle': instance.groupModuleTitle,
      'data': instance.data
    };

DataMeal _$DataMealFromJson(Map<String, dynamic> json) {
  return DataMeal(
      json['id'] as int,
      json['slug'] as String,
      json['howuse'] == null
          ? null
          : Howuse.fromJson(json['howuse'] as Map<String, dynamic>),
      json['cate'] as String,
      json['brandname'] as String,
      json['range'] as String,
      json['mealcount'] as String,
      json['channel'] as String,
      (json['solds'] as num)?.toDouble(),
      json['soldsDesc'] as String,
      (json['start'] as num)?.toDouble(),
      json['imgurl'] as String,
      json['squareimgurl'] as String,
      (json['price'] as num)?.toDouble(),
      (json['value'] as num)?.toDouble(),
      (json['deposit'] as num)?.toDouble(),
      json['optionalattrs'] == null
          ? null
          : Optionalattrs.fromJson(
              json['optionalattrs'] as Map<String, dynamic>),
      json['isAvailableToday'] as bool,
      json['showtype'] as String,
      json['iUrl'] as String,
      json['title'] as String,
      (json['taglist'] as List)
          ?.map((e) =>
              e == null ? null : Taglist.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['shike'] == null
          ? null
          : Shike.fromJson(json['shike'] as Map<String, dynamic>),
      json['campaigns'] as List,
      json['biTuanTag'] as String,
      json['typeLabel'] == null
          ? null
          : TypeLabel.fromJson(json['typeLabel'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DataMealToJson(DataMeal instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'howuse': instance.howuse,
      'cate': instance.cate,
      'brandname': instance.brandname,
      'range': instance.range,
      'mealcount': instance.mealcount,
      'channel': instance.channel,
      'solds': instance.solds,
      'soldsDesc': instance.soldsDesc,
      'start': instance.start,
      'imgurl': instance.imgurl,
      'squareimgurl': instance.squareimgurl,
      'price': instance.price,
      'value': instance.value,
      'deposit': instance.deposit,
      'optionalattrs': instance.optionalattrs,
      'isAvailableToday': instance.isAvailableToday,
      'showtype': instance.showtype,
      'iUrl': instance.iUrl,
      'title': instance.title,
      'taglist': instance.taglist,
      'shike': instance.shike,
      'campaigns': instance.campaigns,
      'biTuanTag': instance.biTuanTag,
      'typeLabel': instance.typeLabel
    };

Howuse _$HowuseFromJson(Map<String, dynamic> json) {
  return Howuse(json['key'] as String);
}

Map<String, dynamic> _$HowuseToJson(Howuse instance) =>
    <String, dynamic>{'key': instance.key};

Optionalattrs _$OptionalattrsFromJson(Map<String, dynamic> json) {
  return Optionalattrs(json['11'] as String, json['81'] as String);
}

Map<String, dynamic> _$OptionalattrsToJson(Optionalattrs instance) =>
    <String, dynamic>{'11': instance.oneone, '81': instance.eightone};

Taglist _$TaglistFromJson(Map<String, dynamic> json) {
  return Taglist(json['name'] as String);
}

Map<String, dynamic> _$TaglistToJson(Taglist instance) =>
    <String, dynamic>{'name': instance.name};

Shike _$ShikeFromJson(Map<String, dynamic> json) {
  return Shike();
}

Map<String, dynamic> _$ShikeToJson(Shike instance) => <String, dynamic>{};

TypeLabel _$TypeLabelFromJson(Map<String, dynamic> json) {
  return TypeLabel();
}

Map<String, dynamic> _$TypeLabelToJson(TypeLabel instance) =>
    <String, dynamic>{};

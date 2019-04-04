// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDataEntity _$NewsDataEntityFromJson(Map<String, dynamic> json) {
  return NewsDataEntity((json['articles'] as List)
      ?.map((e) =>
          e == null ? null : Articles.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$NewsDataEntityToJson(NewsDataEntity instance) =>
    <String, dynamic>{'articles': instance.articles};

Articles _$ArticlesFromJson(Map<String, dynamic> json) {
  return Articles(
      (json['feedTag'] as List)?.map((e) => e as String)?.toList(),
      (json['articleContentList'] as List)?.map((e) => e as String)?.toList(),
      json['_id'] as String,
      json['articleId'] as int,
      json['articleType'] as String,
      json['articleTitle'] as String,
      json['gameStatus'] as String,
      json['gameId'] as int,
      json['gameName'] as String,
      json['gameLogoUrl'] as String,
      json['authorId'] as int,
      json['authorName'] as String,
      json['authorPortraitUrl'] as String,
      json['articleBrief'] as String,
      json['publishDate'] as String,
      json['articleRead'] as int,
      json['articleLike'] as int,
      json['coverBigUrl'] as String,
      json['coverSmallUrl'] as String,
      json['coverTripleUrl'] as String,
      json['imageCollection'] as List,
      json['__v'] as int,
      json['articleContentHtml'] as String,
      json['articleContentMd'] as String,
      json['sortIndex'] as int);
}

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'feedTag': instance.feedTag,
      'articleContentList': instance.articleContentList,
      '_id': instance.id,
      'articleId': instance.articleId,
      'articleType': instance.articleType,
      'articleTitle': instance.articleTitle,
      'gameStatus': instance.gameStatus,
      'gameId': instance.gameId,
      'gameName': instance.gameName,
      'gameLogoUrl': instance.gameLogoUrl,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'authorPortraitUrl': instance.authorPortraitUrl,
      'articleBrief': instance.articleBrief,
      'publishDate': instance.publishDate,
      'articleRead': instance.articleRead,
      'articleLike': instance.articleLike,
      'coverBigUrl': instance.coverBigUrl,
      'coverSmallUrl': instance.coverSmallUrl,
      'coverTripleUrl': instance.coverTripleUrl,
      'imageCollection': instance.imageCollection,
      '__v': instance.v,
      'articleContentHtml': instance.articleContentHtml,
      'articleContentMd': instance.articleContentMd,
      'sortIndex': instance.sortIndex
    };

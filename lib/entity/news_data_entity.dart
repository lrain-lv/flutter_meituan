import 'package:json_annotation/json_annotation.dart';

part 'news_data_entity.g.dart';

@JsonSerializable()
class NewsDataEntity extends Object {
  @JsonKey(name: 'articles')
  List<Articles> articles;

  List<Articles> getArticles() {
    return articles == null ? List() : articles;
  }

  NewsDataEntity(
    this.articles,
  );

  factory NewsDataEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$NewsDataEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsDataEntityToJson(this);
}

@JsonSerializable()
class Articles extends Object {
  @JsonKey(name: 'feedTag')
  List<String> feedTag;

  @JsonKey(name: 'articleContentList')
  List<String> articleContentList;

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'articleId')
  int articleId;

  @JsonKey(name: 'articleType')
  String articleType;

  @JsonKey(name: 'articleTitle')
  String articleTitle;

  @JsonKey(name: 'gameStatus')
  String gameStatus;

  @JsonKey(name: 'gameId')
  int gameId;

  @JsonKey(name: 'gameName')
  String gameName;

  @JsonKey(name: 'gameLogoUrl')
  String gameLogoUrl;

  @JsonKey(name: 'authorId')
  int authorId;

  @JsonKey(name: 'authorName')
  String authorName;

  @JsonKey(name: 'authorPortraitUrl')
  String authorPortraitUrl;

  @JsonKey(name: 'articleBrief')
  String articleBrief;

  @JsonKey(name: 'publishDate')
  String publishDate;

  @JsonKey(name: 'articleRead')
  int articleRead;

  @JsonKey(name: 'articleLike')
  int articleLike;

  @JsonKey(name: 'coverBigUrl')
  String coverBigUrl;

  @JsonKey(name: 'coverSmallUrl')
  String coverSmallUrl;

  @JsonKey(name: 'coverTripleUrl')
  String coverTripleUrl;

  @JsonKey(name: 'imageCollection')
  List<dynamic> imageCollection;

  @JsonKey(name: '__v')
  int v;

  @JsonKey(name: 'articleContentHtml')
  String articleContentHtml;

  @JsonKey(name: 'articleContentMd')
  String articleContentMd;

  @JsonKey(name: 'sortIndex')
  int sortIndex;

  Articles(
    this.feedTag,
    this.articleContentList,
    this.id,
    this.articleId,
    this.articleType,
    this.articleTitle,
    this.gameStatus,
    this.gameId,
    this.gameName,
    this.gameLogoUrl,
    this.authorId,
    this.authorName,
    this.authorPortraitUrl,
    this.articleBrief,
    this.publishDate,
    this.articleRead,
    this.articleLike,
    this.coverBigUrl,
    this.coverSmallUrl,
    this.coverTripleUrl,
    this.imageCollection,
    this.v,
    this.articleContentHtml,
    this.articleContentMd,
    this.sortIndex,
  );

  factory Articles.fromJson(Map<String, dynamic> srcJson) =>
      _$ArticlesFromJson(srcJson);

  Map<String, dynamic> toMap() => <String, dynamic>{
        'articleId': articleId,
        'articleTitle': articleTitle,
        'coverBigUrl': coverBigUrl,
        'authorPortraitUrl': authorPortraitUrl,
        'authorName': authorName,
        'articleRead': articleRead
      };

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

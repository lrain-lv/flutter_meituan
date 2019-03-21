import 'package:json_annotation/json_annotation.dart';

part 'gank_item_entity.g.dart';

@JsonSerializable()
class GankItemEntity {
  bool error;

  List<Result> results;

  GankItemEntity(this.error, this.results);

  factory GankItemEntity.fromJson(Map<String, dynamic> json) =>
      _$GankItemEntityFromJson(json);

  List<Result> getResults() {
    return results == null ? List<Result>() : results;
  }
}

@JsonSerializable(nullable: false)
class Result {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "desc")
  String desc;
  @JsonKey(name: "publishedAt")
  String publishedAt;
  @JsonKey(name: "source")
  String source;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "used")
  bool used;
  @JsonKey(name: "who")
  String who;

  @JsonKey(name: "images")
  List<String> images;

  Result(this.id, this.createdAt, this.desc, this.publishedAt, this.source,
      this.type, this.url, this.used, this.who,this.images);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  List<String> getImages(){
  return  images == null ? List():images;
  }
}

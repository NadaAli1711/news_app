import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/core/api/retrofit/models/articles/articles.dart';

part 'articles_response.g.dart';

@JsonSerializable()
class ArticlesResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalResults")
  final int? totalResults;
  @JsonKey(name: "articles")
  final List<Articles>? articles;

  ArticlesResponse ({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    return _$ArticlesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ArticlesResponseToJson(this);
  }
}





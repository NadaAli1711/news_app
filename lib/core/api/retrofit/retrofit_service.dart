import 'package:dio/dio.dart';
import 'package:news_app/core/api/api_constants.dart';
import 'package:news_app/core/api/end_points.dart';
import 'package:news_app/core/api/retrofit/models/articles/articles_response.dart';
import 'package:news_app/core/api/retrofit/models/sources/source_response.dart';
import 'package:retrofit/retrofit.dart';
part 'retrofit_service.g.dart';
@RestApi(baseUrl: ApiConstants.fullBaseUrl)
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) = _RetrofitService;
  @GET(EndPoints.getSource)
  Future<SourceResponse> fetchSources(
      @Query('apiKey') String apiKey,
      @Query('language') String language,
      @Query('category') String category,
      );
  @GET(EndPoints.getArticle)
  Future<ArticlesResponse> fetchArticles(
      @Query('apiKey') String apiKey,
      @Query('sources') String sources,
      );
  @GET(EndPoints.getEveryThing)
  Future<ArticlesResponse> fetchEveryThing(
      @Query('apiKey') String apiKey,
      @Query('q') String searchString,
      @Query('page') String page,
      @Query('pageSize') String pageSize,
      );
}


import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/utils/api_utils/api_constants.dart';
import 'package:news_app/core/utils/api_utils/end_points.dart';

import '../../models/articles_response.dart';
import '../../models/source_response.dart';

class ApiManager {
  static Future<SourceResponse> fetchSources({required BuildContext context,required String category}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.getSource, {
      'apiKey': ApiConstants.apiKey,
      'language':context.locale.languageCode,
      'category':category
    });
    try {
      var response = await http.get(url);
      /// get the body of the response as string
      String bodyString = response.body;
      /// convert string into json
     var json = jsonDecode(bodyString);
      /// convert json into object
      return SourceResponse.fromJson(json);

    } catch (e) {
      rethrow;
    }
  }
  static Future<ArticlesResponse> fetchArticles({required BuildContext context,required String sources}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.getArticle, {
      'apiKey': ApiConstants.apiKey,
      'sources':sources,
    });
    try {
      var response = await http.get(url);
      /// get the body of the response as string
      String bodyString = response.body;
      /// convert string into json
     var json = jsonDecode(bodyString);
      /// convert json into object
      return ArticlesResponse.fromJson(json);

    } catch (e) {
      rethrow;
    }
  }
}

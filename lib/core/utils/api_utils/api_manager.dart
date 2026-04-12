import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/utils/api_utils/api_constants.dart';
import 'package:news_app/core/utils/api_utils/end_points.dart';

import '../../models/source_response.dart';

class ApiManager {
  static Future<SourceResponse> fetchSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.getSource, {
      'apiKey': ApiConstants.apiKey,
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
}

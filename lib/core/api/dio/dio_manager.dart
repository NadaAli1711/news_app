import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../models/articles_response.dart';
import '../../models/source_response.dart';
import '../api_constants.dart';
import '../end_points.dart';
import 'dio_interceptor.dart';

class DioManager {
  static final dio =
      Dio(
          BaseOptions(
            baseUrl: ApiConstants.dioBaseUrl,
            // queryParameters: {'apiKey': ApiConstants.apiKey},
            headers: {'X-Api-Key': ApiConstants.apiKey},
          ),
        )
        ..interceptors.addAll(
          {
            // DioInterceptor(),
            PrettyDioLogger(),
          },
        ); // or use LogInterceptor() instead and i can change the default inside them
  static Future<SourceResponse> fetchSources({
    required BuildContext context,
    required String category,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.getSource,
        queryParameters: {
          'language': context.locale.languageCode,
          'category': category,
        },
      );
      return SourceResponse.fromJson(response.data);
    } on DioException catch (e) {
      String message = handleDioError(e);
      throw e.copyWith(message: message);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ArticlesResponse> fetchArticles({
    required BuildContext context,
    required String sources,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.getArticle,

        queryParameters: {'sources': sources},
      );
      return ArticlesResponse.fromJson(response.data);
    } on DioException catch (e) {
      String message = handleDioError(e);
      throw e.copyWith(message: message);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ArticlesResponse> fetchEveryThing({
    required BuildContext context,
    required String searchString,
    page = 1,
    pageSize = 10,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.getEveryThing,
        queryParameters: {
          'q': searchString,
          'page': page.toString(),
          'pageSize': pageSize.toString(),
        },
      );

      return ArticlesResponse.fromJson(response.data);
    } on DioException catch (e) {
      String message = handleDioError(e);
      throw e.copyWith(message: message);
    } catch (e) {
      rethrow;
    }
  }
}

// class DioManager {
//   final dio = Dio(
//     BaseOptions(
//         baseUrl: ApiConstants.dioBaseUrl,
//         // queryParameters: {'apiKey': ApiConstants.apiKey},
//         headers: {
//           'X-Api-Key': ApiConstants.apiKey
//         }
//     ),
//
//   ) ;
//   DioManager(){
//     dio.interceptors.add(DioInterceptor());
//     dio.interceptors.add(LogInterceptor());
//   }
//
//    Future<SourceResponse> fetchSources({
//     required BuildContext context,
//     required String category,
//   }) async {
//     try {
//       final response = await dio.get(
//         EndPoints.getSource,
//         queryParameters: {
//           'language': context.locale.languageCode,
//           'category': category,
//         },
//       );
//       return SourceResponse.fromJson(response.data);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//    Future<ArticlesResponse> fetchArticles({
//     required BuildContext context,
//     required String sources,
//   }) async {
//     try {
//       final response = await dio.get(
//         EndPoints.getArticle,
//
//         queryParameters: {'sources': sources},
//       );
//       return ArticlesResponse.fromJson(response.data);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//    Future<ArticlesResponse> fetchEveryThing({
//     required BuildContext context,
//     required String searchString,
//     page = 1,
//     pageSize = 10,
//   }) async {
//     try {
//       final response = await dio.get(
//         EndPoints.getEveryThing,
//         queryParameters: {
//           'q': searchString,
//           'page': page.toString(),
//           'pageSize': pageSize.toString(),
//         },
//       );
//
//       return ArticlesResponse.fromJson(response.data);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
//

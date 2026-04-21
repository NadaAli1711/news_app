import 'package:flutter/cupertino.dart';

import '../api/api_manager.dart';
import '../models/articles_response.dart';
import '../models/source_response.dart';

class ArticlesProvider extends ChangeNotifier {
  ArticlesResponse? articlesResponse;
  bool isLoading = false;
  String? errorMessage;
  Future<void> fetchArticles({
    required BuildContext context,
    required Source source,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      articlesResponse = await ApiManager.fetchArticles(
        context: context,
        sources: source.id ?? '',
      );
      if (articlesResponse?.status == 'error') {
        errorMessage = articlesResponse?.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

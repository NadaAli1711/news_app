import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../models/articles_response.dart';

class SearchProvider extends ChangeNotifier {
  ArticlesResponse? articlesResponse;
  List<Articles> allArticles = [];
  String? errorMessage;
  bool isLoading = false;
  int currentPage = 1;
  int pageSize = 10;
  bool hasMoreData = true;
  bool isLoadingMore = false;
  String lastSearchString = "";

  Future<void> fetchArticles(
    BuildContext context,
    String currentSearchString,
  ) async {
    if (isLoading || isLoadingMore) return;
    if (currentSearchString.isEmpty) {
      resetAll();
      notifyListeners();
      return;
    }
    if (lastSearchString == currentSearchString) {
      /// todo: handle pagination
      if (!hasMoreData) return;
      isLoadingMore = true;
    } else {
      /// todo: handle first page
      resetAll();
      lastSearchString = currentSearchString;
      isLoading = true;
    }

    errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 2));
      articlesResponse = await ApiManager.fetchEveryThing(
        context: context,
        searchString: currentSearchString,
        page: currentPage,
        pageSize: pageSize,
      );
      if(articlesResponse?.status == 'error'){
        errorMessage = articlesResponse?.message;
        notifyListeners();
        return;
      }
      var currentArticles = articlesResponse?.articles ?? [];

      if (currentArticles.isEmpty) {
        hasMoreData = false;
      } else {
        allArticles.addAll(currentArticles);
        currentPage++;
      }
      if (currentArticles.length < pageSize) {
        hasMoreData = false;
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      isLoadingMore = false;
      notifyListeners();
    }
  }

  void resetAll() {
    articlesResponse = null;
    allArticles = [];
    currentPage = 1;
    errorMessage = null;
    hasMoreData = true;
    isLoadingMore = false;
    isLoading = false;
  }
}

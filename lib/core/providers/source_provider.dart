import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../api/dio/dio_manager.dart';
import '../models/source_response.dart';

class SourceProvider extends ChangeNotifier {
  SourceResponse? sourceResponse;
  bool isLoading = false;
  String? errorMessage;
  String category = 'general';
  int tabIndex = 0;
  int categoryIndex = 0;
  void setCategory({ required String currentCategory,}){
    category = currentCategory;
    notifyListeners();
  }
  void setTabIndex({required int index}){
    tabIndex = index;
    notifyListeners();
  }
  void setCategoryIndex({required int index}){
    categoryIndex = index;
    notifyListeners();
  }

  Future<void> fetchSources({
    required BuildContext context
    ,required String category
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      sourceResponse = await DioManager.fetchSources(
        context: context,
        category: category,
      );
    } catch (e) {
      if(e is DioException){
        errorMessage= e.message;
      }else{
      errorMessage = e.toString();}
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // void reset() {
  //   sourceResponse = null;
  //   isLoading = false;
  //   errorMessage = null;
  //   notifyListeners();
  // }
}

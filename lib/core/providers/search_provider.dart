

import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../models/articles_response.dart';

class SearchProvider extends ChangeNotifier{
  ArticlesResponse? articlesResponse;
  String? errorMessage;
  bool isLoading = false;
  Future<void> fetchArticles (BuildContext context, String searchString )async{
    if(searchString.isEmpty){
      articlesResponse = null;
      errorMessage= null;
      notifyListeners();
      return;
    }
    isLoading = true;
    errorMessage= null;
    notifyListeners();
    try{
      articlesResponse = await ApiManager.fetchEveryThing(context: context,searchString: searchString );
    }catch(e){
      errorMessage = e.toString();
    }finally{
      isLoading = false;
      notifyListeners();
  }
  }






}
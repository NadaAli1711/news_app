import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  List<String> languages = ['English', 'Arabic'];
  List<String> languagesCodes = ['en', 'ar'];
  String currentLanguageCode = 'en';
  void changeLanguage(String newLanguageCode){

    if(newLanguageCode == currentLanguageCode){
      return;
    }
    currentLanguageCode = newLanguageCode;
    notifyListeners();
  }
}

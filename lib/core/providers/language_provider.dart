import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  List<String> languages = ['English', 'Arabic'];
  List<String> languagesCodes = ['en', 'ar'];
  String currentLanguageCode = 'en';
  void changeLanguage(String newLanguageCode, BuildContext context) async{

    if(newLanguageCode == currentLanguageCode){
      return;
    }
    currentLanguageCode = newLanguageCode;
    await context.setLocale(Locale(newLanguageCode));
    notifyListeners();
  }
}

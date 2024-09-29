import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  String currentLanguage = "en";
  SharedPreferences? sharedPreferences;

  Future<void> setLanguage()async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(getLanguage() ?? false){
      currentLanguage = "ar";
    }
    else{
      currentLanguage = "en";
    }
  }
  void setCurrentLanguage(String newLanguage){
    currentLanguage = newLanguage;
    saveLanguage(true);
    notifyListeners();
  }
  Future<void> saveLanguage(bool isArabic) async{
    await sharedPreferences!.setBool("isArabic", isArabic);
  }
  bool? getLanguage(){
    return sharedPreferences!.getBool("isArabic");
  }
}
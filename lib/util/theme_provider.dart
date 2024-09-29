import 'package:flutter/material.dart';
import 'package:new_islami/util/app_color.dart';
import 'package:new_islami/util/app_images.dart';
import 'package:new_islami/util/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
    ThemeMode currentTheme = ThemeMode.light;
    SharedPreferences? sharedPreferences;


    toogleTheme(bool darkThemeSwitchValue){
      currentTheme = darkThemeSwitchValue ? ThemeMode.dark: ThemeMode.light;
      saveTheme(true);
      notifyListeners();
    }

    Future<void> setTheme() async{
      sharedPreferences = await SharedPreferences.getInstance();
      if(getTheme() ?? false){
        currentTheme = ThemeMode.dark;
      }
      else{
        currentTheme = ThemeMode.light;
      }
    }

    String get mainBackground =>
      currentTheme == ThemeMode.light ? AppImages.lightBackground : AppImages.darkBackground;

     get AppBarTextStyle =>
        currentTheme == ThemeMode.light ? AppTheme.lightAppBarTextStyle : AppTheme.darkAppBarTextStyle;

    get ContentTextStyle =>
        currentTheme == ThemeMode.light ? AppTheme.lightContentTextStyle : AppTheme.darkContentTextStyle;

     get MediumTitleTextStyle =>
        currentTheme == ThemeMode.light ? AppTheme.lightMediumTitleTextStyle : AppTheme.darkMediumTitleTextStyle;

     get RegularTitleTextStyle =>
        currentTheme == ThemeMode.light ? AppTheme.lightRegularTitleTextStyle : AppTheme.darkRegularTitleTextStyle;

     get SebhaCounter =>
        currentTheme == ThemeMode.light ? AppTheme.lightSebhaCounter : AppTheme.darkSebhaCounter;

     get IntSebhaCounter =>
        currentTheme == ThemeMode.light ? AppTheme.lightIntSebhaCounter : AppTheme.darkIntSebhaCounter;

    get ContentBackground =>
        currentTheme == ThemeMode.light ? AppColors.White : AppColors.darkContentBackGround;

    get SplashLogo =>
        currentTheme == ThemeMode.light ? AppImages.lightSplashLogo : AppImages.darkSplashLogo;

    get SplashBackground =>
        currentTheme == ThemeMode.light ? AppColors.offWhite: AppColors.darkBlue;

    Future<void> saveTheme(bool isDark) async{
      await sharedPreferences!.setBool("isDark", isDark);
    }

    bool? getTheme(){
      return sharedPreferences!.getBool("isDark");
    }
}
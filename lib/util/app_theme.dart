import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class AppTheme{
  /// light theme
  static const TextStyle lightAppBarTextStyle = TextStyle(
      fontSize: 30,
      color: AppColors.lightBlack,
      fontWeight: FontWeight.bold,
  );

  static const TextStyle lightContentTextStyle = TextStyle(
    fontSize: 30,
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle lightMediumTitleTextStyle = TextStyle(
      color: AppColors.lightBlack,
      fontSize: 20,
      fontWeight: FontWeight.w600
  );

  static const TextStyle lightRegularTitleTextStyle = TextStyle(
      color: AppColors.lightBlack,
      fontSize: 20,
      fontWeight: FontWeight.w400
  );

  static const TextStyle lightSebhaCounter = TextStyle(
      color: AppColors.lightBlack,
      fontSize: 26,
      fontWeight: FontWeight.bold
  );

  static const TextStyle lightIntSebhaCounter = TextStyle(
      color: AppColors.lightBlack,
      fontSize: 18,
      fontWeight: FontWeight.bold
  );

  static ThemeData LightTheme = ThemeData(
    primaryColor: AppColors.PrimaryColor,
    scaffoldBackgroundColor: AppColors.Transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.Transparent,
      centerTitle: true,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light ,
      primary: AppColors.PrimaryColor,
      onPrimary: AppColors.onPrimaryColor,
      secondary: AppColors.lightBlack,
      onSecondary:AppColors.lightBlack ,
      error:AppColors.Error ,
      onError:AppColors.Error ,
      background: AppColors.Transparent ,
      onBackground: AppColors.Transparent,
      surface:AppColors.Transparent ,
      onSurface:AppColors.Transparent ,


    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.lightBlack,
      unselectedItemColor: AppColors.White,
      selectedIconTheme: IconThemeData(size: 36),
      unselectedIconTheme: IconThemeData(size: 32),
    )
  );

  /// dark theme

  static const TextStyle darkAppBarTextStyle = TextStyle(
    fontSize: 30,
    color: AppColors.White,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle darkContentTextStyle = TextStyle(
    fontSize: 30,
    color: AppColors.darkGold,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle darkMediumTitleTextStyle = TextStyle(
      color: AppColors.White,
      fontSize: 20,
      fontWeight: FontWeight.w600
  );

  static const TextStyle darkRegularTitleTextStyle = TextStyle(
      color: AppColors.White,
      fontSize: 20,
      fontWeight: FontWeight.w400
  );

  static const TextStyle darkSebhaCounter = TextStyle(
      color: AppColors.White,
      fontSize: 26,
      fontWeight: FontWeight.bold
  );

  static const TextStyle darkIntSebhaCounter = TextStyle(
      color: AppColors.White,
      fontSize: 18,
      fontWeight: FontWeight.bold
  );

  static ThemeData DarkTheme = ThemeData(
      primaryColor: AppColors.darkBlue,
      scaffoldBackgroundColor: AppColors.Transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.Transparent,
        centerTitle: true,
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.dark ,
        primary: AppColors.darkBlue,
        onPrimary: AppColors.ondarkBlue,
        secondary: AppColors.darkGold,
        onSecondary:AppColors.darkGold ,
        error:AppColors.Error ,
        onError:AppColors.Error ,
        background: AppColors.Transparent ,
        onBackground: AppColors.Transparent,
        surface:AppColors.Transparent ,
        onSurface:AppColors.Transparent ,


      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.darkGold,
        unselectedItemColor: AppColors.White,
        selectedIconTheme: IconThemeData(size: 36),
        unselectedIconTheme: IconThemeData(size: 32),
      )
  );

}
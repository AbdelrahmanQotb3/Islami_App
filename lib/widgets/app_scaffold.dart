import 'package:flutter/material.dart';
import 'package:new_islami/util/theme_provider.dart';
import 'package:provider/provider.dart';
import '../util/app_color.dart';
import '../util/app_images.dart';
import '../util/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget? bottomNavigationBar;
  final Widget body;
  AppScaffold({super.key , required this.title , required this.body , this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(themeProvider.mainBackground))),
      child: Scaffold(
        backgroundColor: AppColors.Transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.Transparent,
          title: Text(title, style: AppTheme.lightAppBarTextStyle),
          centerTitle: true,
        ),
        bottomNavigationBar: bottomNavigationBar,
        body: body,
      ),
    );
  }
}

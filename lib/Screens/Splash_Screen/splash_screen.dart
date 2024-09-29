import 'package:flutter/material.dart';
import 'package:new_islami/util/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../util/app_images.dart';
import '../HomeScreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeProvider themeProvider;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, HomeScreen.routname);
    });
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: themeProvider.SplashBackground,
      body: Center(child: Image.asset(themeProvider.SplashLogo)),
    );
  }
}

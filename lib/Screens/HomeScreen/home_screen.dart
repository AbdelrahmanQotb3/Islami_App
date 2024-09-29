import 'package:flutter/material.dart';
import 'package:new_islami/Tabs/Ahadeth/ahadeth_tab.dart';
import 'package:new_islami/Tabs/Quran/quran_tab.dart';
import 'package:new_islami/Tabs/Sebha/sebha_tab.dart';
import 'package:new_islami/Tabs/Settings/settingsTab.dart';
import 'package:new_islami/util/app_color.dart';
import 'package:new_islami/util/app_images.dart';
import 'package:new_islami/util/app_localization.dart';
import 'package:new_islami/util/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../Tabs/Radio/radio_tab.dart';
import '../../util/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  static String routname = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  Widget Body = QuranTab();
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(themeProvider.mainBackground))),
      child: Scaffold(
        backgroundColor: AppColors.Transparent,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigation(),
        body: Body,
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: AppColors.Transparent,
        title: Text(AppLocalizations.of(context)!.islame, style:themeProvider.AppBarTextStyle ),
        centerTitle: true,
      );

  Widget buildBottomNavigation() => Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.QuranIcon), size: 35),
                label: context.setLanguage.quran),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.AhadethIcon), size: 35),
                label: context.setLanguage.ahadeth),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.RadioIcon), size: 35),
                label: context.setLanguage.radio),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.SebhaIcon), size: 35),
                label: context.setLanguage.sebha),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 35),
                label: context.setLanguage.settings)
          ],
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            if (currentTabIndex == 0) {
              Body = QuranTab();
            } else if (currentTabIndex == 1) {
              Body = AhadethTab();
            } else if (currentTabIndex == 2) {
              Body = RadioTab();
            } else if (currentTabIndex == 3) {
              Body = SebhaTab();
            }
            else if(currentTabIndex == 4){
              Body = SettingsTab();
            }
            setState(() {});
          },
        ),
      );
}

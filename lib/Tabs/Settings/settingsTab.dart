import 'package:flutter/material.dart';
import 'package:new_islami/util/app_color.dart';
import 'package:new_islami/util/app_localization.dart';
import 'package:new_islami/util/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_islami/util/language_provider.dart';
import 'package:new_islami/util/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {

   SettingsTab ({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch = false;
  String selectedLanguage = "en";
  bool darkmodeSwitch = false;
  late ThemeProvider themeProvider;
  late LanguageProvider languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.settings , style: themeProvider.MediumTitleTextStyle, textAlign: TextAlign.start,),
          DropdownButton(
            value: selectedLanguage,
              items: [
            DropdownMenuItem(child: Text("English") , value: "en",),
            DropdownMenuItem(child: Text("العربية") , value: "ar",),
          ],
              isExpanded: true ,
              onChanged: (newValue){
              selectedLanguage = newValue!;
              languageProvider.setCurrentLanguage(selectedLanguage);
              setState(() {

              });
              }),
          buildSettingsRow(AppLocalizations.of(context)!.darkMode, darkmodeSwitch, (newValue){
            darkmodeSwitch = newValue;
            setState(() {

            });
          }),
        ],
      ),
    );
  }

  Widget buildSettingsRow(String title , bool switchValue , Function(bool) onChanged){
    return Row(
      children: [
        Text(title , style: themeProvider.RegularTitleTextStyle,),
        Spacer(),
        Switch(value: themeProvider.currentTheme == ThemeMode.dark, onChanged: (newValue){
          themeProvider.toogleTheme(newValue);
        } , activeColor: AppColors.PrimaryColor,)
      ],
    );
  }
}

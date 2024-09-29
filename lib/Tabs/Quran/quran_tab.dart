
import 'package:flutter/material.dart';
import 'package:new_islami/model/sura_details_args.dart';
import 'package:new_islami/Suras/suras.dart';
import 'package:new_islami/util/app_color.dart';
import 'package:new_islami/util/app_images.dart';
import 'package:new_islami/util/app_localization.dart';
import 'package:new_islami/util/app_theme.dart';
import 'package:provider/provider.dart';

import '../../Screens/SuraDetails/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../util/theme_provider.dart';

class QuranTab extends StatelessWidget {
   QuranTab({super.key});
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppImages.QuranTabLogo))),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildScreenContent(context),
              VerticalDivider(
                indent: 7,
                color: AppColors.PrimaryColor,
                thickness: 4,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildScreenContent(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 4,
          color: AppColors.PrimaryColor,
        ),
        Row(
          children: [
            Expanded(
                child: Text(context.setLanguage.suraName,
                    textAlign: TextAlign.center,
                    style: themeProvider.MediumTitleTextStyle)),
            Expanded(
                child: Text(AppLocalizations.of(context)!.suraName,
                    textAlign: TextAlign.center,
                    style: themeProvider.MediumTitleTextStyle)),
          ],
        ),
        Divider(
          thickness: 4,
          color: AppColors.PrimaryColor,
        ),
        Expanded(
            flex: 7,
            child: buildSurasListView()),
      ],
    );
  }

  ListView buildSurasListView() {
    return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SuraDetails.routename,
                        arguments: SuraDetailsArgs(
                            fileName: "${index + 1}.txt",
                            suraName: Suras.suraNames[index]));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Text(
                        "${Suras.versesNumber[index]}",
                        textAlign: TextAlign.center,
                        style: themeProvider.RegularTitleTextStyle,
                      )),
                      Expanded(
                          child: Text(
                        Suras.suraNames[index],
                        textAlign: TextAlign.center,
                        style: themeProvider.RegularTitleTextStyle,
                      ))
                    ],
                  ),
                );
              },
              itemCount: Suras.suraNames.length);
  }
}

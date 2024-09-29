
import 'package:flutter/material.dart';
import 'package:new_islami/Screens/AhadethDetails/ahadethDetails.dart';
import 'package:new_islami/model/ahadeth_details_args.dart';
import 'package:new_islami/util/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../util/app_color.dart';
import '../../util/app_images.dart';
import '../../util/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AhadethTab extends StatelessWidget {
  late ThemeProvider themeProvider;
   AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppImages.HadethTabLogo))),
        Expanded(
          flex: 7,
          child: buildScreenContent(context),
        ),
      ],
    );
  }

  Widget buildScreenContent(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      children: [
        Divider(
          thickness: 4,
          color: AppColors.PrimaryColor,
        ),
        Row(
          children: [
            Expanded(
                child: Text(AppLocalizations.of(context)!.hadethName,
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
          String hadethName = "الحديث رقم  ${index + 1}";
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, AhadethDetails.routename ,
              arguments: AhadethDetailsArgs(fileName: "h${index + 1 }.txt", hadethName: hadethName));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Text(
                      hadethName,
                      textAlign: TextAlign.center,
                      style: themeProvider.RegularTitleTextStyle,
                    ))
              ],
            ),
          );
        },
        itemCount: 50);
  }

}


import 'package:flutter/material.dart';
import 'package:new_islami/util/app_color.dart';
import 'package:new_islami/util/app_images.dart';
import 'package:new_islami/util/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_islami/util/theme_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaCounter = 0;
  int index = 0;
  List<String> sebhaAzkar = ["سبحان الله " , " الحمدلله " , " الله اكبر " ];
  double turns = 0;
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: AnimatedRotation(duration: Duration(microseconds: 300) , turns: turns , child: Image.asset(AppImages.Sebha))  , flex: 2,),
        SizedBox(height: 43,),
        Expanded(child: Column(
          children: [
            Text(AppLocalizations.of(context)!.sebhaCounter , style: themeProvider.SebhaCounter),
            SizedBox(height: 26,),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.Nescafe,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Text("${sebhaCounter}" , style: themeProvider.SebhaCounter,),
            ),
            SizedBox(height: 22,),
            InkWell(
              onTap: (){
                setState(() {
                  turns += 0.1;
                  sebhaCounter++;
                  if(sebhaCounter > 33){
                    sebhaCounter =0;
                    index++;
                    if(index == sebhaAzkar.length){
                      index = 0;
                    }
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.Nescafe,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Text(sebhaAzkar[index], style: themeProvider.SebhaCounter.copyWith(color: Colors.white),),
              ),
            ),
          ],
        ), flex: 3,),

      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/theme_provider.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_context.dart';
import 'item_column.dart';

class VerticalListView extends StatelessWidget {
  static const List<String> blackImages = [
    AppAssets.generalBlack,
    AppAssets.businessBlack,
    AppAssets.sportBlack,
    AppAssets.technologyBlack,
    AppAssets.entertainmentBlack,
    AppAssets.healthBlack,
    AppAssets.scienceBlack,
  ];
  static const List<String> whiteImages = [
    AppAssets.generalWhite,
    AppAssets.businessWhite,
    AppAssets.sportWhite,
    AppAssets.technologyWhite,
    AppAssets.entertainmentWhite,
    AppAssets.healthWhite,
    AppAssets.scienceWhite,
  ];
  const VerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    double height = context.height;
    double width = context.width;
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            height: height * 0.24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage(
                  themeProvider.isDark
                      ? whiteImages[index]
                      : blackImages[index],
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: ItemColumn(index: index,),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: height * 0.02),
        itemCount: blackImages.length,
      ),
    );
  }
}

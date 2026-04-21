import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_context.dart';
import '../../../core/utils/app_styles.dart';
import 'drawer_section.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return Drawer(
      backgroundColor: AppColors.black,
      child: Column(
        spacing: height * 0.02,
        crossAxisAlignment: .stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.white),
            child: Center(
              child: Text(
                'news_app'.tr(),
                style: AppStyles.black24Bold,
                textAlign: .center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
                  },
                  child: DrawerSection(
                    iconName: AppAssets.homeIcon,
                    rowText: 'go_to_home'.tr(),
                  
                  ),
                ),
                DrawerSection(
                  iconName: AppAssets.themeIcon,
                  rowText: 'theme'.tr(),
                  hasThemeDropdown: true,
                ),
                DrawerSection(
                  iconName: AppAssets.worldIcon,
                  rowText: 'language'.tr(),
                  hasLanguageDropdown: true,
                  hasDivider: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

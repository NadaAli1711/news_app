import 'package:flutter/material.dart';
import 'package:news_app/ui/widgets/drawer/theme_dropdown.dart';
import 'package:news_app/ui/widgets/drawer/theme_dropdown2.dart';
import '../../../core/utils/app_context.dart';
import 'drawer_row.dart';
import 'language_dropdown.dart';

class DrawerSection extends StatelessWidget {
  final bool hasDivider;
  final bool hasThemeDropdown;
  final bool hasLanguageDropdown;
  final String rowText;
  final String iconName;
  const DrawerSection({super.key, this.hasDivider = true,
    this.hasThemeDropdown = false,
    this.hasLanguageDropdown = false,
    required this.iconName,
    required this.rowText,
  });


  @override
  Widget build(BuildContext context) {
    double height = context.height;

    return Column(
        spacing: height*0.02,
        children: [
          DrawerRow(text: rowText, iconName: iconName),
          // if(hasThemeDropdown) ThemeDropdown(),
          if(hasThemeDropdown) ThemeDropdown2(),
          if(hasLanguageDropdown) LanguageDropdown(),
          if(hasDivider) const Divider(color: Colors.white,thickness: 1,),
        ],

    );
  }
}

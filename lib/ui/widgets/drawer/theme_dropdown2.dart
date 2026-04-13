import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/theme_provider.dart';

class ThemeDropdown2 extends StatefulWidget {

  const ThemeDropdown2({super.key});

  @override
  State<ThemeDropdown2> createState() => _ThemeDropdown2State();
}

class _ThemeDropdown2State extends State<ThemeDropdown2> {
  static List<String> themes = ['light', 'dark'];
  static List<ThemeMode> themeValues = [ThemeMode.light, ThemeMode.dark];
  // Map<String, ThemeMode> themeMap = {
  //   'light': ThemeMode.light,
  //   'dark': ThemeMode.dark,
  // };
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return DropdownButtonFormField2<ThemeMode>(
      hint: Text(
        themes[themeValues.indexOf(themeProvider.themeMode)].tr(),
        style: AppStyles.white16Bold,
      ),

      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        border: buildBorder,
        enabledBorder: buildBorder,
        focusedBorder: buildBorder,
      ),

      items: themes
          .map(
            (item) => DropdownItem<ThemeMode>(
              value: themeValues[themes.indexOf(item)],
              child: Text(item.tr(), style: AppStyles.black16Bold),
            ),
          )
          .toList(),

      onChanged: (currentThemeMode) {
        if (currentThemeMode != null) {
          themeProvider.changeTheme(currentThemeMode);
        }
      },
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.arrow_drop_down, color: AppColors.white),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      ),
      menuItemStyleData: MenuItemStyleData(
        useDecorationHorizontalPadding: true,
        selectedMenuItemBuilder: (context, child) =>
            Container(color: Colors.grey, child: child),
        overlayColor: WidgetStateProperty.all(Colors.grey),
      ),
    );
  }

  OutlineInputBorder get buildBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    gapPadding: 0,
    borderSide: BorderSide(color: AppColors.white),
  );
}

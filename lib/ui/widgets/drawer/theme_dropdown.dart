import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/theme_provider.dart';

class ThemeDropdown extends StatefulWidget {
  const ThemeDropdown({
    super.key,
  });

  @override
  State<ThemeDropdown> createState() =>
      _ThemeDropdownState();
}

class _ThemeDropdownState
    extends State<ThemeDropdown> {
  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<ThemeProvider>(context);
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: buildBorder,
        enabledBorder: buildBorder,
        focusedBorder: buildBorder,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 10,
        ),
      ),
      items:[
        const DropdownMenuItem(
          value: ThemeMode.light,
          child: Text('Light'),
        ),
        const DropdownMenuItem(
          value: ThemeMode.dark,
          child: Text('Dark'),
        ),
      ],
      onChanged:(newMode) {
        if (newMode != null) {
        themeProvider.changeTheme(newMode);
        // Navigator.of(context).pop();
        }
      },

      // dropdownColor: AppColors.black,

      // alignment: ,
      style: AppStyles.white16Bold,
      icon: Icon(Icons.arrow_drop_down,color: AppColors.white),
      value: themeProvider.themeMode,
    );
  }

  OutlineInputBorder get buildBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: AppColors.white, width: 1),
  );

  // List<String> getLanguageItems() {
  //   var languageProvider = Provider.of<LanguageProvider>(context);
  // languageProvider.currentList.map((element) {
  // return DropdownMenuItem(value: element, child: Text(element));
  // }).toList();}
}

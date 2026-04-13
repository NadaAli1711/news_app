import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/providers/language_provider.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:provider/provider.dart';


class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() =>
      _LanguageDropdownState();
}

class _LanguageDropdownState
    extends State<LanguageDropdown> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return DropdownButtonFormField2<String>(
     hint: Text(
       '${languageProvider.languages[languageProvider.languagesCodes.indexOf(languageProvider.currentLanguageCode)].tr()}',
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

      items: languageProvider.languages
          .map(
            (item) => DropdownItem<String>(
              value: languageProvider
                  .languagesCodes[languageProvider.languages.indexOf(item)],
              child: Text(item, style: AppStyles.black16Bold),
            ),
          )
          .toList(),

      onChanged: (languageCode) {
        if (languageCode != null) {
          languageProvider.changeLanguage(languageCode,context);
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

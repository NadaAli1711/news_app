import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/providers/source_provider.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:provider/provider.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  static List<String> languages = ['english', 'arabic'];
  static List<String> languagesCodes = ['en', 'ar'];
  @override
  Widget build(BuildContext context) {
    var sourceProvider = Provider.of<SourceProvider>(context);
    return DropdownButtonFormField2<String>(
      hint: Text(
        languages[languagesCodes.indexOf(context.locale.languageCode)].tr(),
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

      items: languages
          .map(
            (item) => DropdownItem<String>(
              value: languagesCodes[languages.indexOf(item)],
              child: Text(item.tr(), style: AppStyles.black16Bold),
            ),
          )
          .toList(),

      onChanged: (languageCode) async {
        if (languageCode != null) {
          await context.setLocale(Locale(languageCode));
          sourceProvider.fetchSources(context: context, category: sourceProvider.category);
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

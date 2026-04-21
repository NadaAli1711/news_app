import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/theme_provider.dart';
import '../../../core/utils/app_context.dart';
import '../../../core/utils/list_utils.dart';
import 'item_column.dart';

class CategoryContainer extends StatelessWidget {
  final int index;
  const CategoryContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;

    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      height: height * 0.24,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(
            themeProvider.isDark
                ? ListUtils.whiteImages[index]
                : ListUtils.blackImages[index],
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: ItemColumn(index: index),
    );
  }
}

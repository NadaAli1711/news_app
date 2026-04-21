import 'package:flutter/material.dart';
import 'package:news_app/ui/widgets/category_list_view/view_all_row.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import '../../../core/providers/source_provider.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_context.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/list_utils.dart';

class ViewAllElevatedButton extends StatelessWidget {

  final int index;
  const ViewAllElevatedButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var sourceProvider = Provider.of<SourceProvider>(context);
    bool isEven = index % 2 == 0;
    double width = context.width;
    double height = context.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whiteOpcity50,
        fixedSize: Size(width * 0.4, height * 0.056),
        padding: isEven
            ? EdgeInsetsGeometry.only(left: width * 0.02)
            : EdgeInsetsGeometry.only(right: width * 0.02),
      ),
      onPressed: () {
        sourceProvider.setCategory(currentCategory:ListUtils.titles[index] );
        Navigator.of(context).pushReplacementNamed(AppRoutes.detailsScreen);

      },
      child: Directionality(
        textDirection: isEven ? ui.TextDirection.rtl : ui.TextDirection.ltr,
        child: ViewAllRow(),
      ),
    );
  }
}

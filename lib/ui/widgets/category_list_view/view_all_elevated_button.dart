import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/core/utils/list_utils.dart';
import 'package:news_app/ui/widgets/category_list_view/view_all_row.dart';
import 'dart:ui' as ui;
import '../../../core/utils/api_utils/api_manager.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_context.dart';

class ViewAllElevatedButton extends StatelessWidget {

  final int index;
  const ViewAllElevatedButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
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
        Navigator.of(context).pushReplacementNamed(AppRoutes.generalScreen,arguments: ListUtils.titles[index]);
      },
      child: Directionality(
        textDirection: isEven ? ui.TextDirection.rtl : ui.TextDirection.ltr,
        child: ViewAllRow(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/ui/widgets/vertical_list_view/view_all_row.dart';
import 'dart:ui' as ui;
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_context.dart';

class ViewAllElevatedButton extends StatelessWidget {
  final bool isEven;
  const ViewAllElevatedButton({super.key,required this.isEven});

  @override
  Widget build(BuildContext context) {
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
      onPressed: () {},
      child: Directionality(
        textDirection: isEven ? ui.TextDirection.rtl : ui.TextDirection.ltr,
        child: ViewAllRow(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_context.dart';
import 'package:news_app/core/utils/app_styles.dart';

class DrawerRow extends StatelessWidget {
  final String iconName;
  final String text;
  const DrawerRow({super.key,
    required this.text,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return Row(
      spacing: width*0.02,

      children: [
         // SvgPicture.asset(iconName),
        Image.asset(iconName,),
        Text(text,style: AppStyles.white20Bold,)
      ],
    );
  }
}

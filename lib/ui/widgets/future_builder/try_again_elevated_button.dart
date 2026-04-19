import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_context.dart';

class TryAgainElevatedButton extends StatelessWidget {
  const TryAgainElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return  ElevatedButton(style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(vertical: height*0.02),
      minimumSize: Size(width*0.6, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),onPressed: () {}, child: Text('try_again'.tr(),style:Theme.of(context).textTheme.labelMedium));
  }
}

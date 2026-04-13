import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_context.dart';

class ViewAllRow extends StatelessWidget {
  const ViewAllRow({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return  Row(
      spacing: width * .01,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).cardColor,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          'view_all'.tr(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}

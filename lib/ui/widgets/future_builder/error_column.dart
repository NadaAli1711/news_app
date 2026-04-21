import 'package:flutter/material.dart';
import 'package:news_app/ui/widgets/future_builder/try_again_elevated_button.dart';

import '../../../core/utils/app_context.dart';

class ErrorColumn extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;
  const ErrorColumn({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
      child: Column(
        spacing: height * 0.03,
        children: [
          Text(errorMessage, style: Theme.of(context).textTheme.bodyMedium),
          TryAgainElevatedButton(onPressed: onPressed),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_context.dart';

class ItemColumn extends StatelessWidget {
  static const List<String> titles = [
    'General',
    'Business',
    'Sport',
    'Technology',
    'Entertainment',
    'Health',
    'Science',
  ];
  final int index;
  const ItemColumn({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;
    double height = context.height;
    double width = context.width;
    return Column(
      mainAxisAlignment: .spaceEvenly,
      crossAxisAlignment: isEven ? .end : .start,
      children: [
        Text(
          titles[index],
          textAlign: .center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whiteOpcity50,
            fixedSize: Size(width * 0.4, height * 0.056),
            padding: isEven
                ? EdgeInsetsGeometry.only(left: width * 0.02)
                : EdgeInsetsGeometry.only(right: width * 0.02),
          ),
          onPressed: () {},
          child: Row(
            spacing: width * .01,
            textDirection: isEven ? TextDirection.rtl : TextDirection.ltr,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).cardColor,
                child: Icon(
                  isEven ? Icons.arrow_forward_ios : Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                'View All',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/utils/app_context.dart';
import '../../../core/utils/list_utils.dart';
import 'category_container.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CategoryContainer(index: index);
        },
        separatorBuilder: (context, index) => SizedBox(height: height * 0.02),
        itemCount: ListUtils.blackImages.length,
      ),
    );
  }
}

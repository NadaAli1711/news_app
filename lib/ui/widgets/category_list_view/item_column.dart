import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/widgets/category_list_view/view_all_elevated_button.dart';
import '../../../core/utils/list_utils.dart';

class ItemColumn extends StatelessWidget {
  final int index;
  const ItemColumn({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;
    return Column(
      mainAxisAlignment: .spaceEvenly,
      crossAxisAlignment: context.locale.languageCode == 'ar'
          ? isEven
                ? .start
                : .end
          : isEven
          ? .end
          : .start,
      children: [
        Text(
          ListUtils.titles[index].tr(),
          textAlign: .center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ViewAllElevatedButton(index: index,),
      ],
    );
  }
}

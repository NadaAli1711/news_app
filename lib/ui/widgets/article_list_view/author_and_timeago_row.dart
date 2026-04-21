import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../core/utils/app_context.dart';
import '../../../core/utils/app_styles.dart';

class AuthorAndTimeAgoRow extends StatelessWidget {
  final String? publishedAt;
  final String? author;
  const AuthorAndTimeAgoRow({super.key,
     this.publishedAt,
       this.author,
  });

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return  Row(
      spacing: width*0.06,
      mainAxisAlignment: .spaceBetween,
      children: [
        Flexible(
          child: Text(author != null && author!.isNotEmpty?
            "${'by'.tr()} $author"
                : 'unknown_author'.tr(),
            maxLines: 2,
            overflow: .ellipsis,
            style: AppStyles.grey12Medium,
          ),
        ),

        Text(
          timeago.format(
            DateTime.parse(
              publishedAt ?? DateTime.now().toString(),
            ),
            locale: context.locale.languageCode,
          ),
          style: AppStyles.grey12Medium,
        ),
      ],
    );
  }

}

import 'package:flutter/material.dart';

import '../../../core/models/articles_response.dart';
import 'author_and_timeago_row.dart';
import 'bottom_sheet_elevated_button.dart';

class ArticleCardColumn extends StatelessWidget {
  final Articles article;
  final bool isBottomSheet;
  const ArticleCardColumn({super.key,
    required this.article,
    this.isBottomSheet = false

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          isBottomSheet? Text(
            article.description ?? '',
            style: Theme.of(context).textTheme.headlineSmall,
          ):
          Text(
            article.title ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          isBottomSheet?BottomSheetElevatedButton(articleUrl:article.url ,):AuthorAndTimeAgoRow(
            author: article.author,
            publishedAt: article.publishedAt,

          ),
        ],
      ),
    );
  }
}

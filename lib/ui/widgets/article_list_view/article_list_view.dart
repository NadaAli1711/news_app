import 'package:flutter/material.dart';

import '../../../core/models/articles_response.dart';
import '../../../core/utils/app_context.dart';
import 'article_card.dart';

class ArticleListView extends StatelessWidget {
  final List<Articles>? articles;
  final ScrollController? controller;
  const ArticleListView({super.key,
    this.articles,
    this.controller
  });

  @override
  Widget build(BuildContext context) {

    double height = context.height;
    double width = context.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: ListView.separated(
        controller: controller,
        itemCount: articles?.length ?? 0,
        itemBuilder: (context, index) {
          return ArticleCard(
            article:articles?[index] ?? Articles(),
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(height: height * 0.02),
      ),
    );
  }
}

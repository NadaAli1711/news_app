import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/articles_response.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/utils/app_context.dart';

class ArticleCard extends StatelessWidget {
  final Articles article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return Container(
      height: height * 0.4,
      padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Column(
        spacing: height * 0.01,
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              clipBehavior: .antiAlias,
              borderRadius: BorderRadius.circular(16),
              child: Image.network(article.urlToImage ?? '', fit: BoxFit.fill,width: double.infinity,),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  article.title ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'By : ${article.author}',
                      style: AppStyles.grey12Medium,
                    ),
                    Text(
                      timeago.format(
                        DateTime.parse(
                          article.publishedAt ?? DateTime.now().toString(),
                        ),
                        locale: context.locale.languageCode,
                      ),
                      style: AppStyles.grey12Medium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

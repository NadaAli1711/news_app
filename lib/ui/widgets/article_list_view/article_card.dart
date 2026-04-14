import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/articles_response.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/utils/app_context.dart';

class ArticleCard extends StatefulWidget {
  final Articles article;
  const ArticleCard({super.key, required this.article});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return InkWell(
      // onTap: ,
      child: Container(
        height: height * 0.45,
        padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Column(
          spacing: height * 0.01,
          children: [
            Expanded(
              flex: 7,
              child: ClipRRect(
                clipBehavior: .antiAlias,
                borderRadius: BorderRadius.circular(16),
                child: Image.network(widget.article.urlToImage ?? '', fit: BoxFit.fill,width: double.infinity,),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    widget.article.title ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Row(
                    spacing: width*0.06,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.article.author != null && widget.article.author!.isNotEmpty?
                          'By : ${widget.article.author}'
                            : 'News Source',
                          maxLines: 2,
                          overflow: .ellipsis,
                          style: AppStyles.grey12Medium,
                        ),
                      ),

                      Text(
                        timeago.format(
                          DateTime.parse(
                            widget.article.publishedAt ?? DateTime.now().toString(),
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
      ),
    );
  }

  // void showModal(){
  //   showModalBottomSheet(context: context, builder: (context) => ,)
  // }
}

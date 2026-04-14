import 'package:flutter/material.dart';
import 'package:news_app/core/models/articles_response.dart';
import '../../../core/utils/app_context.dart';
import 'article_card_column.dart';
import 'article_card_image.dart';

class ArticleCard extends StatefulWidget {
  final Articles article;
  final bool isBottomSheet;
  const ArticleCard({super.key, required this.article, this.isBottomSheet = false});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return InkWell(
      onTap: () => showModal(article: widget.article),
      child: Container(
        height: widget.isBottomSheet?height * 0.55:height * 0.45,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.01,
        ),
        decoration: BoxDecoration(
          color: widget.isBottomSheet?Theme.of(context).primaryColor:Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border:widget.isBottomSheet?null: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Column(
          spacing: height * 0.01,
          children: [
            ArticleCardImage(urlToImage: widget.article.urlToImage),
            ArticleCardColumn(
              isBottomSheet:widget.isBottomSheet,
              article: widget.article,
            ),
          ],
        ),
      ),
    );
  }

  void showModal({required Articles article}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(horizontal:context.width*0.04, vertical: context.height*0.02),
        child: ArticleCard(article: article, isBottomSheet: true,),
      ),
    );
  }
}

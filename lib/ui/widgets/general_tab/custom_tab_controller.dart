import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_context.dart';
import 'package:news_app/ui/widgets/general_tab/source_tab.dart';

import '../../../core/models/articles_response.dart' hide Source;
import '../../../core/models/source_response.dart';
import '../../../core/api/api_manager.dart';
import '../article_list_view/article_list_view.dart';
import '../future_builder/custom_future_builder.dart';
import '../header/header.dart';
import '../search/search_text_field.dart';

class CustomTabController extends StatefulWidget {
  final List<Source> sources;
  const CustomTabController({super.key, required this.sources});

  @override
  State<CustomTabController> createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController> {
  int selectedIndex = 0;
  List<Articles>? articles;
  @override
  Widget build(BuildContext context) {
    double height = context.height;
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        spacing: height * 0.03,
        children: [
           Column(
            children: [
              Header(headerText: 'general'.tr()),
              TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                indicatorColor: Theme.of(context).primaryColor,
                dividerColor: AppColors.transparent,
                tabAlignment: .start,
                isScrollable: true,
                tabs: widget.sources.map((source) {
                  return SourceTab(
                    sourceName: source.name ?? '',
                    isSelected:
                    selectedIndex == widget.sources.indexOf(source),
                  );
                }).toList(),
              ),
            ],
          ),

         Expanded(
            child: TabBarView(
              children: widget.sources.map((source) {
                return CustomFutureBuilder<ArticlesResponse>(
                  future: ApiManager.fetchArticles(
                    context: context,
                    sources: source.id ?? '',
                  ),
                  onSuccess: (context, data) {
                    articles = data.articles;
                     return ArticleListView(articles:articles);},
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

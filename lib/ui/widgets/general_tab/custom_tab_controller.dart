
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_context.dart';
import 'package:news_app/ui/widgets/general_tab/source_tab.dart';

import '../../../core/models/articles_response.dart' hide Source;
import '../../../core/models/source_response.dart';
import '../../../core/utils/api_utils/api_manager.dart';
import '../article_list_view/article_card.dart';
import '../custom_future_builder.dart';

class CustomTabController extends StatefulWidget {
  final List<Source> sources;
  const CustomTabController({super.key, required this.sources});

  @override
  State<CustomTabController> createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        spacing: height*0.03,
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {
              });
            },
            indicatorColor: Theme.of(context).primaryColor,
            dividerColor: AppColors.transparent,
            tabAlignment: .start,
            isScrollable: true,
            tabs: widget.sources.map((source) {
              return SourceTab(sourceName: source.name ?? '',isSelected: selectedIndex == widget.sources.indexOf(source),);
            }).toList(),
          ),
          Expanded(
            child: TabBarView(children: widget.sources.map((source) {
              return CustomFutureBuilder<ArticlesResponse>(
                future: ApiManager.fetchArticles(
                  context: context,
                  sources: source.id ?? '',
                ),
                onSuccess: (context, data) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: ListView.separated(
                      itemCount: data.articles?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ArticleCard(
                          article: data.articles?[index] ?? Articles(),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: height * 0.02),
                    ),
                  ),
                ),
              );
            }).toList(),),
          )
        ],
      ),
    );
  }
}

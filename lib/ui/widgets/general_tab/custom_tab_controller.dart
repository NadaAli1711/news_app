import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_context.dart';
import 'package:news_app/ui/widgets/general_tab/source_tab.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/articles_provider.dart';
import '../../../core/providers/source_provider.dart';
import '../article_list_view/article_list_view.dart';
import '../future_builder/error_column.dart';
import '../future_builder/main_circular_progress_indicator.dart';

class CustomTabController extends StatefulWidget {
  const CustomTabController({super.key});

  @override
  State<CustomTabController> createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var sourceProvider = Provider.of<SourceProvider>(context, listen: false);
      var articlesProvider = Provider.of<ArticlesProvider>(
        context,
        listen: false,
      );
      if (sourceProvider.sourceResponse?.sources?.isNotEmpty ?? false) {
        articlesProvider.fetchArticles(
          context: context,
          source: sourceProvider.sourceResponse!.sources![0],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var sourceProvider = Provider.of<SourceProvider>(context);
    var articlesProvider = Provider.of<ArticlesProvider>(context);
    var sources = sourceProvider.sourceResponse?.sources ?? [];
    double height = context.height;
    return DefaultTabController(
      length: sources.length,
      child: Column(
        spacing: height * 0.03,
        children: [
          TabBar(
            onTap: (index) {
              sourceProvider.setTabIndex(index: index);
              articlesProvider.fetchArticles(
                context: context,
                source: sources[index],
              );
            },
            indicatorColor: Theme.of(context).primaryColor,
            dividerColor: AppColors.transparent,
            tabAlignment: .start,
            isScrollable: true,
            tabs: sources.map((source) {
              return SourceTab(
                sourceName: source.name ?? '',
                isSelected: sourceProvider.tabIndex == sources.indexOf(source),
              );
            }).toList(),
          ),

          Expanded(
            child: TabBarView(
              children: sources.map((source) {
                return articlesProvider.isLoading
                    ? Center(child: MainCircularProgressIndicator())
                    : articlesProvider.errorMessage != null
                    ? ErrorColumn(
                        onPressed: () => articlesProvider.fetchArticles(
                          context: context,
                          source: sources[sourceProvider.tabIndex],
                        ),
                        errorMessage:
                            articlesProvider.errorMessage ??
                            'some_thing_went_wrong'.tr(),
                      )
                    : articlesProvider.articlesResponse == null
                    ? Center(child: Text('no_data_found'.tr()))
                    : (articlesProvider.articlesResponse?.articles?.isEmpty ??
                          false)
                    ? Center(child: Text('no_data_found'.tr()))
                    : ArticleListView(
                        articles: articlesProvider.articlesResponse?.articles,
                      );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

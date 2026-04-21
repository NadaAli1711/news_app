import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/utils/app_context.dart';
import 'package:provider/provider.dart';

import '../../core/providers/search_provider.dart';
import '../../core/utils/app_assets.dart';
import '../widgets/article_list_view/article_list_view.dart';
import '../widgets/future_builder/error_column.dart';
import '../widgets/future_builder/main_circular_progress_indicator.dart';
import '../widgets/search/search_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent * 0.9) {
          var searchProvider = Provider.of<SearchProvider>(
            context,
            listen: false,
          );
          if (searchProvider.lastSearchString.isNotEmpty) {
            searchProvider.fetchArticles(
              context,
              searchProvider.lastSearchString,
            );
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    double height = context.height;
    double width = context.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: height * 0.02,
          children: [
            SearchTextField(),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: searchProvider.isLoading
                        ? Lottie.asset(
                            AppAssets.lottieLoadingAnimation,
                            width: double.infinity,
                            height: height * 0.2,
                          )
                        : searchProvider.errorMessage != null
                        ? ErrorColumn(
                            onPressed: () => searchProvider.fetchArticles(
                              context,
                              searchProvider.lastSearchString,
                            ),
                            errorMessage:
                                searchProvider.errorMessage ??
                                'some_thing_went_wrong'.tr(),
                          )
                        : searchProvider.articlesResponse == null
                        ? Text('start_searching'.tr())
                        : (searchProvider.articlesResponse?.articles?.isEmpty ??
                              false)
                        ? Text('no_data_found'.tr())
                        : ArticleListView(
                            controller: scrollController,
                            articles: searchProvider.allArticles,
                          ),
                  ),

                  if (searchProvider.isLoadingMore)
                    Lottie.asset(
                      AppAssets.lottieBlueLoadingAnimation,
                      width: width * 0.3,
                      height: height * 0.3,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }
}

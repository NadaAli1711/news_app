import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/search_provider.dart';
import '../widgets/article_list_view/article_list_view.dart';
import '../widgets/future_builder/error_column.dart';
import '../widgets/future_builder/main_circular_progress_indicator.dart';
import '../widgets/search/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchTextField(),
            searchProvider.isLoading
                ? MainCircularProgressIndicator()
                : searchProvider.errorMessage != null
                ? ErrorColumn(
                    errorMessage:
                        searchProvider.errorMessage ??
                        'some_thing_went_wrong'.tr(),
                  )
                : searchProvider.articlesResponse == null
                ? Text('start_searching'.tr())
                : searchProvider.articlesResponse!.articles!.isEmpty
                ? Text('no_data_found'.tr())
                : ArticleListView(
                    articles: searchProvider.articlesResponse!.articles!,
                  ),
          ],
        ),
      ),
    );
  }
}

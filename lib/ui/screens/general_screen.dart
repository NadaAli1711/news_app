import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/models/articles_response.dart';
import '../../core/models/source_response.dart';
import '../../core/utils/api_utils/api_manager.dart';
import '../../core/utils/app_context.dart';
import '../widgets/article_list_view/article_card.dart';
import '../widgets/custom_future_builder.dart';
import '../widgets/general_tab/custom_tab_controller.dart';
import '../widgets/drawer/app_drawer.dart';
import '../widgets/header/header.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    String category = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          spacing: height * 0.03,
          children: [
            Header(headerText: 'general'.tr()),
            CustomFutureBuilder<SourceResponse>(
              future: ApiManager.fetchSources(
                context: context,
                category: category,
              ),
              onSuccess: (context, data) =>
                  Expanded(
                    child: Column(
                      spacing: height * 0.03,
                      children: [
                        CustomTabController(sources: data.sources ?? []),
                        CustomFutureBuilder<ArticlesResponse>(
                          future: ApiManager.fetchArticles(
                            context: context,
                            sources: 'bbc-news',
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
                        ),
                      ],
                    ),
                  ),
            ),

          ],
        ),
      ),
    );
  }
}

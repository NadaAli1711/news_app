import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/widgets/future_builder/main_circular_progress_indicator.dart';
import 'package:provider/provider.dart';
import '../../core/providers/source_provider.dart';
import '../../core/utils/app_context.dart';
import '../widgets/future_builder/error_column.dart';
import '../widgets/general_tab/custom_tab_controller.dart';
import '../widgets/drawer/app_drawer.dart';
import '../widgets/header/header.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var sourceProvider = Provider.of<SourceProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => sourceProvider.fetchSources(
        context: context,
        category: sourceProvider.category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var sourceProvider = Provider.of<SourceProvider>(context);
    // String category = ModalRoute.of(context)?.settings.arguments as String;
    double height = context.height;
    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          spacing: height * 0.02,
          children: [
            Header(headerText: sourceProvider.category.tr()),
            Expanded(
              child: sourceProvider.isLoading
                  ? Center(child: MainCircularProgressIndicator())
                  : sourceProvider.errorMessage != null
                  ? ErrorColumn(
                onPressed: ()=> sourceProvider.fetchSources(
                  context: context,
                  category: sourceProvider.category,
                ),
                      errorMessage:
                          sourceProvider.errorMessage ??
                          'some_thing_went_wrong'.tr(),
                    )
                  : sourceProvider.sourceResponse == null
                  ? Center(child: Text('no_data_found'.tr()))
                  : (sourceProvider.sourceResponse?.sources?.isEmpty ?? false)
                  ? Center(child: Text('no_data_found'.tr()))
                  : CustomTabController(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/models/source_response.dart';
import '../../core/api/api_manager.dart';
import '../widgets/future_builder/custom_future_builder.dart';
import '../widgets/general_tab/custom_tab_controller.dart';
import '../widgets/drawer/app_drawer.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: CustomFutureBuilder<SourceResponse>(
          future: ApiManager.fetchSources(context: context, category: category),
          onSuccess: (context, data) =>
              Expanded(child: CustomTabController(sources: data.sources ?? [])),
        ),
      ),
    );
  }
}

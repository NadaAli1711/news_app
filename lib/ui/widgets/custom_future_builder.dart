import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/models/source_response.dart';
import '../../core/utils/api_utils/api_manager.dart';
import 'custom_tab_controller.dart';
import 'main_circular_progress_indicator.dart';

class Customfuturebuilder extends StatelessWidget {
  const Customfuturebuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.fetchSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainCircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text({snapshot.error}.toString()),
              ElevatedButton(onPressed: () {}, child: Text('try_again'.tr())),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text({snapshot.data!.message}.toString()),
              ElevatedButton(onPressed: () {}, child: Text('try_again'.tr())),
            ],
          );
        }
        List<Source> sources = snapshot.data?.sources ?? [];
        return CustomTabController(sources: sources,);

      },
    );
  }
}

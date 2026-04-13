import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_context.dart';
import '../widgets/category_list_view/vertical_list_view.dart';
import '../widgets/drawer/app_drawer.dart';
import '../widgets/header/header.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Header(headerText: 'home'.tr()),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: height * 0.02,
                  children: [
                    Text(
                      'good_morning_news_message'.tr(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    VerticalListView(),
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

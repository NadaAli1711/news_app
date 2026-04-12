import 'package:flutter/material.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_context.dart';
import '../widgets/drawer/app_drawer.dart';
import '../widgets/header.dart';
import '../widgets/vertical_list_view/vertical_list_view.dart';

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
            Header(headerText: 'Home'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  spacing: height * 0.02,
                  children: [
                    Text(
                      'Good Morning\nHere is Some News For You',
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

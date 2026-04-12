
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_context.dart';
import '../../core/utils/app_styles.dart';
import '../widgets/custom_future_builder.dart';
import '../widgets/drawer/app_drawer.dart';
import '../widgets/drawer/drawer_section.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  @override
  Widget build(BuildContext context) {
    // double height = context.height;
    // double width = context.width;

    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(child: Customfuturebuilder()),
    );
  }
}

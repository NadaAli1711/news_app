import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_context.dart';
import 'package:news_app/ui/widgets/source_tab.dart';

import '../../core/models/source_response.dart';
import 'header.dart';

class CustomTabController extends StatefulWidget {
  final List<Source> sources;
  const CustomTabController({super.key, required this.sources});

  @override
  State<CustomTabController> createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = context.height;
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        spacing: height*0.03,
        children: [
          Header(headerText: 'General',),
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {
              });
            },
            indicatorColor: Theme.of(context).primaryColor,
            dividerColor: AppColors.transparent,
            tabAlignment: .start,
            isScrollable: true,
            tabs: widget.sources.map((source) {
              return SourceTab(sourceName: source.name ?? '',isSelected: selectedIndex == widget.sources.indexOf(source),);
            }).toList(),
          ),
          // Expanded(child: TabBarView(children: widget.sources.map((source) {
          //   return SourceCard(source: source,);
          // }).toList(),))
        ],
      ),
    );
  }
}

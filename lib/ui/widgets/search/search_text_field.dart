import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/search_provider.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return TextField(
      textInputAction: .search,
      controller: searchController,
      onSubmitted: (searchString) =>
          searchProvider.fetchArticles(context, searchString),
      decoration: InputDecoration(
        hintText: 'search'.tr(),
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        prefixIcon: IconButton(
          onPressed: () {
            searchProvider.fetchArticles(context, searchController.text);
          },
          icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            searchProvider.resetAll();
            searchController.clear();
          },
          icon: Icon(Icons.close, color: Theme.of(context).primaryColor),
        ),
        border: buildBorder,
        enabledBorder: buildBorder,
        focusedBorder: buildBorder,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  OutlineInputBorder get buildBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Theme.of(context).primaryColor),
  );
}

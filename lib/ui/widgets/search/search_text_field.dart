import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/search_provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return TextField(
      onSubmitted: (searchString) =>
          searchProvider.fetchArticles(context, searchString),
      decoration: InputDecoration(
        hintText: 'search'.tr(),
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.close, color: Theme.of(context).primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}

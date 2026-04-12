import 'package:flutter/material.dart';

import '../../core/models/source_response.dart';

class SourceCard extends StatelessWidget {
  final Source source;
  const SourceCard({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Column(
        children: [
          Expanded(flex: 2, child: Image.network(source.url ?? '')),
          Expanded(
            child: Text(source.description??'', style: Theme.of(context).textTheme.bodyMedium),
          ),
          // Row(mainAxisAlignment: .spaceBetween,
          //   children: [Text(data),],)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SourceTab extends StatelessWidget {
  final String sourceName;
  final bool isSelected;
  const SourceTab({
    super.key,
    required this.sourceName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sourceName,
      style: isSelected
          ? Theme.of(context).textTheme.bodyMedium
          : Theme.of(context).textTheme.bodySmall,
    );
  }
}

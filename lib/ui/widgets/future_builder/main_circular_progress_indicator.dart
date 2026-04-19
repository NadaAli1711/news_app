import 'package:flutter/material.dart';

class MainCircularProgressIndicator extends StatelessWidget {
  const MainCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
  }
}

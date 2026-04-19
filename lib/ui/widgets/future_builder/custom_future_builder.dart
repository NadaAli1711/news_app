import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'main_circular_progress_indicator.dart';
import 'error_column.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext context, T data) onSuccess;

  const CustomFutureBuilder({
    super.key,
    required this.future,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainCircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return ErrorColumn(errorMessage: {snapshot.error}.toString());
        }
        final response = snapshot.data as dynamic;
        if (response?.status != 'ok') {
          return ErrorColumn(errorMessage: {response!.message}.toString());
        }
        return onSuccess(context, response!);
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/app_context.dart';

class BottomSheetElevatedButton extends StatelessWidget {
  final String ? articleUrl;
  const BottomSheetElevatedButton({super.key,
    this.articleUrl

  });

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    return ElevatedButton(style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).cardColor,
      padding: EdgeInsets.symmetric(vertical: height*0.02),
      minimumSize: Size(double.infinity, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),onPressed: (){
      _launchUrl(articleUrl: articleUrl);
    }, child: Text('view_full_article'.tr(),style: Theme.of(context).textTheme.bodyMedium,));
  }
  Future<void> _launchUrl({required String? articleUrl}) async {
    if (articleUrl == null) return;
    final Uri _url = Uri.parse(articleUrl);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }
}

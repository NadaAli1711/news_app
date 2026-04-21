// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../future_builder/main_circular_progress_indicator.dart';
//
// class ArticleCardImage extends StatelessWidget {
//   final String? urlToImage;
//   const ArticleCardImage({super.key, this.urlToImage});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 7,
//       child: ClipRRect(
//         clipBehavior: .antiAlias,
//         borderRadius: BorderRadius.circular(16),
//         child: CachedNetworkImage(
//           imageUrl: urlToImage ?? '',
//           fit: BoxFit.fill,
//           width: double.infinity,
//           placeholder: (context, url) =>
//               Center(child: MainCircularProgressIndicator()),
//           errorWidget: (context, url, error) => Icon(Icons.error),
//         ),
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_context.dart';

import '../../../core/utils/app_assets.dart';
import '../future_builder/main_circular_progress_indicator.dart';

class ArticleCardImage extends StatelessWidget {
  final String? urlToImage;
  const ArticleCardImage({super.key, this.urlToImage});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    return ClipRRect(
      clipBehavior: .antiAlias,
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: urlToImage ?? '',
        fit: BoxFit.fill,
        width: double.infinity,
        placeholder: (context, url) =>
            Center(child: MainCircularProgressIndicator()),
        errorWidget: (context, url, error) => ImageIcon(
          AssetImage(AppAssets.notFoundImage),
          size: height * 0.25,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

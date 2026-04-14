import 'package:flutter/material.dart';

class ArticleCardImage extends StatelessWidget {
  final String? urlToImage;
  const ArticleCardImage({super.key,
    this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: ClipRRect(
        clipBehavior: .antiAlias,
        borderRadius: BorderRadius.circular(16),
        child: Image.network(urlToImage ?? '', fit: BoxFit.fill,width: double.infinity,),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String headerText ;
  const Header({super.key,required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        IconButton(onPressed: () {
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu,color: Theme.of(context).primaryColor,)),
        Text(headerText,style: Theme.of(context).textTheme.bodyLarge,),
        IconButton(onPressed: () {}, icon: Icon(Icons.search,color: Theme.of(context).primaryColor,)),
      ],
    );
  }
}

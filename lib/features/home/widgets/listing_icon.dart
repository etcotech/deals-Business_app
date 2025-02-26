import 'package:flutter/material.dart';

class ListingIcon extends StatelessWidget {
  final IconData? iconData;
  const ListingIcon({super.key, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle ,

        color: Theme.of(context).primaryColor.withAlpha(70)
      ),

      child: Center(child: Icon(iconData , size: 18, color: Theme.of(context).primaryColor,),),
    );
  }
}
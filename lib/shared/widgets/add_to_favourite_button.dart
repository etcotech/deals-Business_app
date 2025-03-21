import 'package:flutter/material.dart';

class AddToFavouriteButton extends StatelessWidget {
  final Function? onTap;
  final  bool? isFavourite;
  const AddToFavouriteButton({super.key, this.onTap, 
  this.isFavourite});


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GestureDetector(

        onTap: (){
          onTap!();
        },
        child: Container(
        
          width: 40, height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), 
            color: Colors.grey.withAlpha(50), 
           
          ),
          child: Center(
            child: Icon(
              isFavourite!? Icons.favorite:
              Icons.favorite_outline , 
            
            color: Theme.of(context).primaryColor,),
          ),
        ),
      ),
    );
  }
}
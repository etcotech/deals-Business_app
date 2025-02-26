import 'package:flutter/material.dart';

class SelectedCategoryWidget extends StatelessWidget {
  final String? title;
  const SelectedCategoryWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 30,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width*.40, 
        
      ),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withAlpha(40), 
      borderRadius: BorderRadius.circular(50)
    
    ),
    child: Center(
      child: Row(
        // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      
          Text(title! ,
          overflow: TextOverflow.ellipsis,
           style: TextStyle(
      color: Theme.of(context).primaryColor ,
      fontSize: 10, fontWeight: FontWeight.bold
          ),),
      
          // IconButton(onPressed: (){
      
          // }, icon: Icon(Icons.close , size: 12, color: Theme.of(context).primaryColor , ))
    
    Icon(Icons.close , size: 12, color: Theme.of(context).primaryColor , )
        ],
      ),
    ),
    );
  }
}
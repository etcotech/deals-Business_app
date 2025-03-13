import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubCategoryWidget extends StatelessWidget {
  final String? image;
  final String? title;
  const SubCategoryWidget({super.key, this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return 
       Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.sizeOf(context).width*.28,
           height: MediaQuery.sizeOf(context).width*.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), 
              color: Colors.white, 
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.grey[300]!,
                  blurRadius: 4,
                  spreadRadius: 1
                )
              ]
            ),
      
            child: Center(
              child: Column(
      
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
      
                 Icon(Icons.folder,              
                       color: Theme.of(context).primaryColor, 
                       size: 35,
      ), 
      SizedBox(height: 8,),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width*.25,
                    child: Text(title! , 
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                     fontWeight: FontWeight.bold, 
                      fontSize: 12
                    ),
                    ),
                  )
                ],
              ),
            ),
      );
    
  }


  getIcon(String? icon){
    switch (icon) {
      case  "fas fa-store":
         return  FontAwesomeIcons.store;
        case  "fas fa-cog":
         return  FontAwesomeIcons.gear;
         case  "fas fa-users":
         return  FontAwesomeIcons.users;


      default:
               return  Icons.category;

    }
  }

}
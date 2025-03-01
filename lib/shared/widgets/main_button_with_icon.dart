import 'package:flutter/material.dart';

class MainButtonWithIcon extends StatelessWidget {
  final Function? onTap;
  final bool? isLoading;
  final IconData? icon;
  final Color? color;
  final String? title;

  const MainButtonWithIcon({super.key, this.onTap, this.isLoading=false, this.color, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return 
    
    isLoading!? 
    Center(child: CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
    ),)

    :
    GestureDetector(
      onTap: (){
        onTap!();
        
      },
      child: Container(
        // width: MediaQuery.sizeOf(context).width,
        height: 40,
      
        decoration: BoxDecoration(
          color: color , 
      
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child:
          icon!=null?

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Icon(icon, color: Colors.white ),
                        SizedBox(width: 5,),

Text(title!, 
          
          style: TextStyle(
            color: Colors.white , fontWeight: FontWeight.w600,
      fontSize: 18
      
          ),
          ),
            ],
          ):
           Text(title!, 
          
          style: TextStyle(
            color: Colors.white , fontWeight: FontWeight.bold,
      fontSize: 20
      
          ),
          ),
        ),
      ),
    );
  }
}
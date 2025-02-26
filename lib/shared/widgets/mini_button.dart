import 'package:flutter/material.dart';

class MiniButton extends StatelessWidget {
  final Function? onTap;
  final bool? isLoading;
  final Color? color;
  final String? title;

  const MiniButton({super.key, this.onTap, this.isLoading=false, this.color, this.title});

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
        width: MediaQuery.sizeOf(context).width*.45,
        height: 40,
      
        decoration: BoxDecoration(
          color: color , 
      
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(title!, 
          
          style: TextStyle(
            color: Colors.white , fontWeight: FontWeight.bold,
      fontSize: 15
      
          ),
          ),
        ),
      ),
    );
  }
}
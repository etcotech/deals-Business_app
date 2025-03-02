import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final Function? onTap;
  const SendButton({super.key, this.onTap});


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GestureDetector(

        onTap: (){
          onTap!();
        },
        child: Container(
        
          width: 35, height: 35,
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
            child: Icon(Icons.send, color: Theme.of(context).primaryColor,),
          ),
        ),
      ),
    );
  }
}
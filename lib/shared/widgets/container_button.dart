import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final String? title;
  final String? hint;
  final IconData? icon;
  final Function? onTap;
  const ContainerButton({super.key, this.title, this.icon, this.onTap, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
width: MediaQuery.sizeOf(context).width,
      height: 50 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      color:   Colors.grey[200]
      ),
      child: 

Row(
  mainAxisSize: MainAxisSize.min,
  children: [
Icon(icon , color: Theme.of(context).primaryColor,),
SizedBox(width: 10,), 
Text(

  title!=null? title!: hint!,
  style: TextStyle(
          color:
          title!=null? Colors.black:
           Colors.grey ,
          fontSize: 15
        ),
)

  ],
)
      ,
    );
  }
}
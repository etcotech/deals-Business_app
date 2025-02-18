import 'package:flutter/material.dart';

class AddImagesContainer extends StatefulWidget {
  const AddImagesContainer({super.key});

  @override
  State<AddImagesContainer> createState() => _AddImagesContainerState();
}

class _AddImagesContainerState extends State<AddImagesContainer> {
  bool? hasImages=false;
  List<String> images =[];
  @override
  Widget build(BuildContext context) {
    return  AnimatedCrossFade(firstChild: 
    
    Container(
      width: MediaQuery.sizeOf(context).width,
      height: 100 ,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), 
        border: Border.all(
          width: 1, color: Colors.grey
        )
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Icon(Icons.image_outlined , size: 50,), 
Text("press to upload images from your phone" , 
style: TextStyle(
  color: Colors.grey, fontWeight: FontWeight.bold
),
), 



        ],
      ),
    )
    , secondChild: Container(
      width: MediaQuery.sizeOf(context).width,
      height: 100 ,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), 
        border: Border.all(
          width: .5, color: Colors.grey
        )
      ),
    ), crossFadeState: images.isEmpty?
    CrossFadeState.showFirst:CrossFadeState.showSecond
    
    , duration: Duration(milliseconds: 500));
  }
}
import 'dart:io';

import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddImagesContainer extends StatefulWidget {
  const AddImagesContainer({super.key});

  @override
  State<AddImagesContainer> createState() => _AddImagesContainerState();
}

class _AddImagesContainerState extends State<AddImagesContainer> {
  bool? hasImages=false;
  List<String> images =[];
final ImagePicker picker = ImagePicker();
 openStudio(Function(List<XFile>? image) selectedImage)async{
  var images = await picker.pickMultiImage();
selectedImage(images);


 }


  @override
  Widget build(BuildContext context) {
    return  Consumer<PostProvider>(
      builder: (context ,provider,child) {
        return AnimatedCrossFade(firstChild: 
        
        GestureDetector(
          onTap: (){
            openStudio((image){

             for (var img in image!) {
      provider.addFile(img);

  }
            });
          },
          child: Container(

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
          ),
        )
        , secondChild: Container(
          width: MediaQuery.sizeOf(context).width,
          height: provider.files.length*100/  4  + 80,
        padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), 
            border: Border.all(
              width: .5, color: Colors.grey
            )
          ),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
SizedBox(
  //  height: provider.files.length* 120,
          height: provider.files.length*100/  4  ,

  //  width: 80,
  child: GridView.count(crossAxisCount: 4, 
  shrinkWrap: true,
  childAspectRatio: 1,
  mainAxisSpacing:3 ,
  children: provider.files.map((image){
    return Center(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(File(image.path), 
            height: 100,
            width: 80,
            fit: BoxFit.cover,
            ),),

            PositionedDirectional(
              start: 8,
              top: 10,
              child: GestureDetector(
                onTap: (){
                  provider.remoteFile(image.path);
                },
                child: Container(
                  width: 20,height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red ,
                    shape: BoxShape.circle
                  ),
                  child: Center(child: Icon(Icons.close,color: Colors.white,size: 15,),),
                ),
              ))
        ],

      
      ),
    );
  }).toList(),
  
  ),
),
Spacer(),
  // SizedBox(height: 10,),
TextButton.icon(
  icon: Icon(Icons.add, color: Colors.black,),
  onPressed: (){
openStudio((image){
  for (var img in image!) {
      provider.addFile(img);

  }
});
}, label: Text('add more', style: TextStyle(
  color: Colors.grey
),)),

  // SizedBox(height: 10,),


],),



        ), crossFadeState: provider.files.isEmpty?
        CrossFadeState.showFirst:CrossFadeState.showSecond
        
        , duration: Duration(milliseconds: 500));
      }
    );
  }
}
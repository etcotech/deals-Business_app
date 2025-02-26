import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentTab =0;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
if (false) {
  return Scaffold(
    body: SizedBox.expand(
      child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),),
    ),
  );
}

else{
  return Scaffold(

appBar: AppBar(
leading: BackButton(),
title: Text(getTranslated(Strings.profile, context)!),
backgroundColor: Colors.transparent,
),

body: SizedBox.expand(
  child: SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 24),
    child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      SizedBox(height: 24,) , 

//header
SizedBox(
  width: MediaQuery.sizeOf(context).width,
  height: MediaQuery.sizeOf(context).height*.25,
  child: Stack(
    alignment: Alignment.center,
    children: [

  

 Positioned(
  bottom: 0,
   child:


    Container(
          
           width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height*.20,
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
            alignment: Alignment.bottomCenter,
padding: EdgeInsets.symmetric(vertical: 8, 
horizontal: 8
),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
SizedBox(height: MediaQuery.sizeOf(context).height*.05,),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
      Column( crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on_outlined ,color: Colors.grey ,size: 15,), 
          Text(getTranslated(Strings.region, context)!, 
          style: TextStyle(
            color: Colors.grey ,fontSize: 15,
          ),
          
          )
        ],),
        
        Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(Images.flag, 
        width: 24, height: 24,
        ),
        Text('SA' , 
        style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold
        ),
        )
      ],
        )
        
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person_outline ,color: Colors.grey ,size: 15,), 
          Text(getTranslated(Strings.name, context)!, 
          style: TextStyle(
            color: Colors.grey ,fontSize: 15,
          ),
          
          )
        ],),
        
        Text('Kururu' , 
        style: TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold
        ),
        )
        
        ],
      ),
      
      
        ],
      ),
    ), 

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
      
          Text(getTranslated(Strings.editMyProfile, context)! ,
          overflow: TextOverflow.ellipsis,
           style: TextStyle(
      color: Theme.of(context).primaryColor ,
      fontSize: 10, fontWeight: FontWeight.bold
          ),),
      
          // IconButton(onPressed: (){
      
          // }, icon: Icon(Icons.close , size: 12, color: Theme.of(context).primaryColor , ))
    
    Icon(Icons.edit , size: 12, color: Theme.of(context).primaryColor , )
        ],
      ),
    ),
    )
  ],
),


   ),
 
 
 )
  ,Positioned(
      top: 5,
      child: Container(
            
             padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(8), 
                color: Colors.white, 
                boxShadow: [
                //  BoxShadow(
                //     offset: Offset(0, 1),
                //     color: Colors.grey[300]!,
                //     blurRadius: 4,
                //     spreadRadius: 1
                //   )
      
                ]
              ),
              child: CircleAvatar(
                radius: MediaQuery.sizeOf(context).height*.05,
            backgroundColor: Colors.grey,    
              ),
         ),
    ),
 


    ],
  ),
),
SizedBox(height: 12,)
///tabs
,
Center(
  child: 
    Container(
          padding: EdgeInsets.all(5),
           width: MediaQuery.sizeOf(context).width*.45,
    height: MediaQuery.sizeOf(context).height*.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), 
              color: Colors.white, 
              boxShadow: [
               BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.grey[300]!,
                  blurRadius: 4,
                  spreadRadius: 1
                ),
                  BoxShadow(
                  offset: Offset(1, 0),
                  color: Colors.grey[300]!,
                  blurRadius: 4,
                  spreadRadius: 1
                ),
                
              ]
            ),

            child: Row(
              children: [
GestureDetector(
  onTap: (){
    _currentTab = 0;
    setState(() {
      
    });
  },
  child: Container(
            
             width: (MediaQuery.sizeOf(context).width*.45)*.48,
      height: MediaQuery.sizeOf(context).height*.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), 
  color:
  
  _currentTab==0?
   Theme.of(context).primaryColor:Colors.white
              ),
              child: Center(child: Text(getTranslated(Strings.posts, context)!,
              style: TextStyle(
                color: 
                _currentTab==0?
                Colors.white :Colors.black
                ,fontSize: 15
              ),
              ),),
  ),
), 
GestureDetector(
  onTap: (){
      _currentTab = 1;
    setState(() {
      
    });
  },
  child: Container(
            
             width: (MediaQuery.sizeOf(context).width*.45)*.45,
      height: MediaQuery.sizeOf(context).height*.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), 
  color:
  _currentTab ==1?
   Theme.of(context).primaryColor:Colors.white,
              ),
              child: Center(child: Text(getTranslated(Strings.statics, context)!,
              style: TextStyle(
                color:
                _currentTab==1?
                 Colors.white :Colors.black,fontSize: 15
              ),
              ),),
  ),
), 



              ],
            ),
    )
)
,
SizedBox(height: 16,)

//tab view
,
Builder(builder: (context){

  if (_currentTab==0) {
    return SizedBox();
  }
  else{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
_title(Strings.posts)
,
_statsWidget(Strings.published, 1),
_statsWidget(Strings.pendingPosts, 1),
_statsWidget(Strings.favourite, 1),
_statsWidget(Strings.archived, 0),
_title(Strings.threads)
,
_statsWidget(Strings.all, 1),

_title(Strings.general)
,
_statsWidget(Strings.nubmerOfVisits, 1),

      ],);
  }
})



    ],
  ),),
),
  );
}


    });


  }
  Widget _statsWidget(String key , int count){
    return  SizedBox(
      width: MediaQuery.sizeOf(context).width,
      
  height:  MediaQuery.sizeOf(context).height*.09,
  child: Card(
  color: Colors.white,
    semanticContainer: true,
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child: Center(child: Row(
  
  
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(getTranslated(key, context)!,
      style: TextStyle(
        fontWeight: FontWeight.bold,  fontSize: 18
      ),
      ), 
  
      Text(count.toString() , 
      
      style: TextStyle(
        color: Theme.of(context).primaryColor ,
        fontSize: 15, fontWeight: FontWeight.bold
      ),
      )
    ],
  )),
),
  )
  );
  }
  Widget _title(String title){
    return Text(getTranslated(title, context)!,
    style: TextStyle(
      color: Colors.grey ,
      fontSize: 12
    ),
    );
  }
}
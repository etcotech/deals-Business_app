import 'dart:developer';

import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/features/profile/views/edit_profile_screen.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/error_container.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentTab =0;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){

context.read<ProfileProvider>().getUserProfile(
  userData:
  (user){
log(user!.genderId.toString());
log("TYPE${user.userTypeId}");

});
context.read<ProfileProvider>().getUserStats();


    });
  }
  @override
  Widget build(BuildContext context) {

    // var profileProvider = Provider.of<ProfileProvider>(context);
    return Consumer<ProfileProvider>(builder: (context, provider,child){
if (provider.isLoading) {
  return Scaffold(
    body: SizedBox.expand(
      child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),),
    ),
  );
}
else if(provider.errorData!=null){
return Scaffold(
    body: SizedBox.expand(
      child: Center(

child: ErrorContainer(
  onRetry: (){
context.read<ProfileProvider>().getUserProfile();
context.read<ProfileProvider>().getUserStats();
  },
  onLogin: (){


  },
  errorData: 
  provider.errorData!),

      ),
    ),
  );

}

else{
  return Scaffold(
// backgroundColor: Colors.white,
appBar: AppBar(
leading:MyBackButton(
  onTap: (){
    Navigator.pop(context);
  },
),
title: Text(getTranslated(Strings.profile, context)!),
backgroundColor: Colors.transparent,
),

body: SizedBox.expand(
  child: SingleChildScrollView(
    // padding: EdgeInsets.symmetric(horizontal: 24),
    child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      SizedBox(height: 16,) , 

//header
Container(
  padding: EdgeInsets.symmetric(
    horizontal: 8
  ),
  width: MediaQuery.sizeOf(context).width,
  height: MediaQuery.sizeOf(context).height*.23,
  child: Stack(
    fit: StackFit.expand,
    alignment: Alignment.center,
    children: [

  

 Positioned(
  bottom: 0,
   child:


  Container(
        padding: EdgeInsets.all(16),
         width: MediaQuery.sizeOf(context).width,
  height: MediaQuery.sizeOf(context).height*.20,
      
      child: Card(
        color: Colors.white,
  elevation: .2,
         
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
  SizedBox(height: MediaQuery.sizeOf(context).height*.02,),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      spacing: 32,
      
      mainAxisAlignment: MainAxisAlignment.center,
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
      SizedBox(width: 5,),
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
      
      Text(provider.profileModel!.name! , 
      style: TextStyle(
    fontSize: 15, fontWeight: FontWeight.bold
      ),
      )
      
      ],
    ),
    
    
      ],
    ),
  ), 
  
   GestureDetector(
    onTap: (){
      Navigator.of(context).push(

        PageTransition(type: PageTransitionType.leftToRight , 
        child: EditProfileScreen(
          profileModel: provider.profileModel,
        )
        )
      );
    },
     child: Container(
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
       ),
   )
    ,
    SizedBox(height: 8,)
    ],
  ),
  
      ),
  
     ),
 
 
 )
  ,Positioned(
      top: 1,
      child:
      
       Container(
            
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
                radius: MediaQuery.sizeOf(context).height*.04,
            backgroundColor: Colors.grey[300],    
backgroundImage: provider.getUserPhoto()!.isEmpty?
AssetImage(Images.user): NetworkImage( provider.getUserPhoto()!)
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
    height: MediaQuery.sizeOf(context).height*.06,
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
    return SizedBox(child: Center(

      child: Text('No posts'),
    ),);
  }
  else{
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
      _title(Strings.posts)
      ,
      _statsWidget(Strings.published,        
      provider.statsModel!.posts!.published!
),
      _statsWidget(Strings.pendingPosts, 
      
       provider.statsModel!.posts!.pendingApproval!
      ),
      _statsWidget(Strings.favourite,  provider.statsModel!.posts!.favourite!),
      _statsWidget(Strings.archived,  provider.statsModel!.posts!.archived!),
      _title(Strings.threads)
      ,
      _statsWidget(Strings.all, 
      
             provider.statsModel!.threads!.all!

      ),
      
      _title(Strings.general)
      ,
      _statsWidget(Strings.nubmerOfVisits,
       provider.statsModel!.posts!.visits!
      
      
      ),
      
        ],),
    );
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
  elevation: .1,
    semanticContainer: true,
child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Center(child: Row(
  
  
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(getTranslated(key, context)!,
      style: TextStyle(
        fontWeight: FontWeight.bold,  fontSize: 16
      ),
      ), 
  
      Text(count.toString() , 
      
      style: TextStyle(
        color: Theme.of(context).primaryColor ,
        fontSize: 16, fontWeight: FontWeight.bold
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
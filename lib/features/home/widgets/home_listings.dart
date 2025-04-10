
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:deals_and_business/features/home/widgets/listing_icon.dart';
import 'package:deals_and_business/features/posts/views/post_details_screen.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/features/report/views/report_screen.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/views/post_preview_image_widget.dart';
import 'package:deals_and_business/shared/widgets/delete_account_alert.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeListings extends StatefulWidget {
  const HomeListings({super.key});

  @override
  State<HomeListings> createState() => _HomeListingsState();
}

class _HomeListingsState extends State<HomeListings> {
  bool isList= false;
  final ScrollController _listScrollController = ScrollController();
  final ScrollController _gridtScrollController = ScrollController();

  void _listScrollListener() {
    if (_listScrollController.position.pixels ==
        _listScrollController.position.maxScrollExtent) {
      //Fetch
log("BOTTOM OF LISt");

    }
  }

  void _gridScrollListener() {
    if (_gridtScrollController.position.pixels ==
        _gridtScrollController.position.maxScrollExtent) {
      //Fetch
log("BOTTOM OF GRID");

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gridtScrollController.addListener(_gridScrollListener);
        _listScrollController.addListener(_listScrollListener);

  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _gridtScrollController.dispose();
    _listScrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;    
/*24 is for notification bar on Android*/
final double itemHeight = (size.height - kToolbarHeight - 24) *.35; 
final double itemWidth = size.width*.43;
    return  Consumer<HomeProvider>(
     builder: (context, provider, child)=>  Builder(
        builder: (context) {

          if (provider.isLoading) {
             return 
          
          
          Skeletonizer(
            enabled: true,
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18), 
              child: Column(
                spacing: 16,
                children: [
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getTranslated('last_ads', context)!,
                            
                            style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold
                            ),
                            ),
            
            
                    AnimatedCrossFade(
                      
                      firstCurve: Curves.bounceIn,
                      secondCurve: Curves.bounceOut,
                      firstChild: 
            
                    IconButton(onPressed: (){
            isList = false;
            setState(() {
              
            });
                    }, icon: Icon(Icons.list, color: Colors.grey,))
                    , secondChild: IconButton(onPressed: (){
            isList = true;
            setState(() {
              
            });
                    }, icon: Icon(Icons.widgets, color: Colors.grey,)) 
                    , crossFadeState: isList?
                    CrossFadeState.showFirst:CrossFadeState.showSecond
                    , duration: Duration(
            microseconds: 500
                    ))
                    ],
                  ), 
               
              GridView.count(
                crossAxisCount: 2, 
              shrinkWrap: true,
              childAspectRatio:  MediaQuery.sizeOf(context).height*.45/
              MediaQuery.sizeOf(context).width*.45,
              children: [1,2,3,4].map((dummy){
              return Container(
              height: MediaQuery.sizeOf(context).height*.45,
              width:MediaQuery.sizeOf(context).width*.45 ,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color:Colors.white ,  borderRadius: BorderRadius.circular(8), 
                          
                boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.grey[300]!,
                blurRadius: 4,
                spreadRadius: 1
              )
                          ]
              ),
              child: Column(
                children: [
                  SizedBox(width: 50 ,height: 10,),
                      SizedBox(width: 40 ,height: 10,)
              
                ],
              ),
              );
              
              }).toList(),
              
              )
               
               
               
                ],
              ),
            ),
          );
        
          }
else{
   return 
          
          
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 18), 
            child: Column(
              children: [
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(getTranslated('last_ads', context)!,
                          
                          style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold
                          ),
                          ),
          
          
                  AnimatedCrossFade(
                    
                    firstCurve: Curves.bounceIn,
                    secondCurve: Curves.bounceOut,
                    firstChild: 
          
                  IconButton(onPressed: (){
          isList = true;
          setState(() {
            
          });
                  }, icon: Icon(Icons.list, color: Colors.grey,))
                  , secondChild: IconButton(onPressed: (){
          isList = false;
          setState(() {
            
          });
                  }, icon: Icon(Icons.widgets, color: Colors.grey,)) 
                  , crossFadeState: !isList?
                  CrossFadeState.showFirst:CrossFadeState.showSecond
                  , duration: Duration(
          microseconds: 500
                  ))
                  ],
                ), 



                  AnimatedCrossFade(
                    
                    firstCurve: Curves.elasticInOut,
                    secondCurve: Curves.elasticInOut,  
                    firstChild: 
 ListView( 
  controller: _listScrollController,
  shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
                  
                children: provider.posts.map((post)=>  HomePost(
                  isList: true,postModel: post,
                )).toList(),)
, 
secondChild:             GridView.count(
                  controller: _gridtScrollController,
                  shrinkWrap: true,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
      //              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   mainAxisExtent: 150, // Set fixed height for each item
      // ),
      // itemCount: provider.posts.length,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 
                  itemWidth/
                 itemHeight
                  ,
                  
                  
                  crossAxisCount: 2,
                
                children: provider.posts.map((post)=>  HomePost(
                  isList: false,postModel: post,
                )).toList(),
// itemBuilder: (context, index) {
//   var post =  provider.posts[index];
//   return   HomePost(
//                   isList: false,postModel: post,
//                 );
// },


                ) , 

crossFadeState: isList?
CrossFadeState.showFirst:CrossFadeState.showSecond
, duration: Duration(
milliseconds: 800
))
                  ])
/*
if (isList) ListView( 
  controller: _listScrollController,
  shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
                  
                children: provider.posts.map((post)=>  HomePost(
                  isList: true,postModel: post,
                )).toList(),) else 
                
                GridView.count(
                  controller: _gridtScrollController,
                  shrinkWrap: true,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
      //              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   mainAxisExtent: 150, // Set fixed height for each item
      // ),
      // itemCount: provider.posts.length,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 
                  itemWidth/
                 itemHeight
                  ,
                  
                  
                  crossAxisCount: 2,
                
                children: provider.posts.map((post)=>  HomePost(
                  isList: false,postModel: post,
                )).toList(),
// itemBuilder: (context, index) {
//   var post =  provider.posts[index];
//   return   HomePost(
//                   isList: false,postModel: post,
//                 );
// },


                )
*/
          
            //   ],
            // ),
          );
        
}
         
        
        }
      ),
    );
  }
}


class HomePost extends StatelessWidget {
  final bool? isList;
  final PostModel? postModel;
  const HomePost({super.key, this.isList=false, this.postModel});

  @override
  Widget build(BuildContext context) {
var size = MediaQuery.of(context).size;    
final double itemHeight = (size.height - kToolbarHeight - 24) *.35; 
final double itemWidth = size.width*.43;
var provider = Provider.of<PostProvider>(context);
var userProvider =  Provider.of<ProfileProvider>(context);
var homeProvider =  Provider.of<HomeProvider>(context);

    return AnimatedCrossFade(firstChild: 
    GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(type: 
        
        PageTransitionType.leftToRight , 
        child: PostDetailsScreen(
          postId: postModel!.id.toString(),
        )
        ));
      },
      child:
      
       SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height/7,
        
        
        child: Card(
          color: Colors.white,
              semanticContainer: true,
          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
        
          ),
        child:
         Container(width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height/7,
        padding: EdgeInsets.all(5),          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

PostPreviewImageWidget(imageUrl: postModel!.picture!.url!.big!, 

postId: postModel!.id,
),
/*
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
      
                child:
                 Image.network(
                  errorBuilder: (context, error, stackTrace) {
                    
      return Center(child: Icon(Icons.image ,color: Colors.grey,),);
                  },
                  postModel!.picture!.url!.big!, 
            width:    MediaQuery.sizeOf(context).width*.30,
                height: MediaQuery.sizeOf(context).height/7,
              fit: BoxFit.cover,
                ),
                
                ),
          
          
          */
          SizedBox(width: 5,),
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
      
                       SizedBox(
                              width: MediaQuery.sizeOf(context).width*.35,
                              child: Text(
                                  postModel!.category==null?'':
                                postModel!.category!.name.toString(), 
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold
                              ),
                              ),
                            ), 
        
        
        
          SizedBox(
            width: MediaQuery.sizeOf(context).width*.35,
            child: Text(postModel!.title!, 
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
          ), 
          
          
          Row(
            children: [
              ListingIcon(
                iconData: Icons.schedule,
              ),
              SizedBox(width: 3,),
              Text(postModel!.createdAtFormatted!.toString(), 
              style: TextStyle(
                color: Colors.grey
              ),
              )
            ],
          )
          
      
      
          
                  //  ,SizedBox(height: 6,)
      
                ],
              )
            ],
          ), 
          
          
          // Icon(Icons.more_vert_outlined, color: Colors.grey,)
          PopupMenuButton(
      
            menuPadding: EdgeInsets.zero,
      
              onSelected: (choice){
     if (choice== Strings.reportApost) {
        Navigator.of(context).push(
        PageTransition(type: 
        
        PageTransitionType.leftToRight ,child: ReportScreen(

          postId: postModel!.id.toString(),
        )
        )
      );
     }else{
      showDialog(context: context,
       builder: (_)=> DeleteAccountAlert(
        isDelete: true, 
        onConfirm: (){
provider.delete(context, postModel!.id.toString(),
 (){
homeProvider.refreshPosts(context);
 });
        },
        title: getTranslated(Strings.areYouSureDeletePost, context),
       ));

     }
              },
              padding: EdgeInsets.zero,
              // initialValue: choices[_selection],
              itemBuilder: (BuildContext context) {
                return [
                  
                  
                  postModel!.userId.toString()== userProvider.getUserId()?
                Strings.deleteThePost:
                 Strings.reportApost].map((String choice) {
                  return  PopupMenuItem<String>(
                  value: choice,
                  child: Text(getTranslated(choice, context)!, 
                style: TextStyle(
                  color: Colors.grey
                ),
                  ),
                );}
                ).toList();
              },
            position: PopupMenuPosition.under,
      
            
            ), 
      
          
            ],
          ),
        ),
        
        )),
   
   
    )
    
    
    , secondChild: 
    
     GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(type: 
        
        PageTransitionType.leftToRight , 
        child: PostDetailsScreen(
          postId: postModel!.id.toString(),
        )
        ));
      },
       child: Card(
        // margin: EdgeInsets.symmetric(horizontal: 2,
        // vertical: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
       // height:   itemHeight,
       //            width:        itemWidth,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(15), 
            //   color: Colors.white, 
            //   boxShadow: [
            //     BoxShadow(
            //       offset: Offset(0, 1),
            //       color: Colors.grey[300]!,
            //       blurRadius: 4,
            //       spreadRadius: 1
            //     )
            //   ]
            // ),
       child: Column(
           
        spacing: 0,
         children: [
           SizedBox(
                      height:   itemHeight*.55,
             width:       itemWidth,
       
             child: Stack(
               children: [
                 SizedBox(
                      height:   itemHeight*.60,
             width:    itemWidth,
                   child: ClipRRect(
                                   borderRadius: BorderRadius.circular(15.0),
                                   child: 


                                   CachedNetworkImage(
                                    
                                           imageUrl: postModel!.picture!.url!.full!,
                                          height:   itemHeight*.60,
                                          fit: BoxFit.cover,
                                                width:    itemWidth,
                                               //  scale: 5,
                                                     // height: MediaQuery.sizeOf(context).height/7,
                                           placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                           errorWidget: (context, url, error) => Icon(Icons.photo_camera_outlined , 
                                           size: 50,
                                         
                                           ),
                                         ),
                  //                  Image.network(postModel!.picture!.url!.full!, 
                                   
                  //  fit: BoxFit.cover,
                  //  scale: 5,
       
                  //                  )
                                   
                                   
                                   ),
                 ),
             
                   PositionedDirectional(
                     bottom: 10,
                     start: 5,
                     child: Visibility(
                       visible:
                       
                        postModel!.savedByLoggedUser!.isNotEmpty,

                       child: Icon(Icons.bookmark , color: Colors.green,)))
               ],
             ),
           )
       ,
       SizedBox(height: 12,),
       Padding(padding: EdgeInsets.symmetric(horizontal: 8),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
       
          Text(postModel!.title!,
       maxLines: 2,
       overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
          
          ), 
       SizedBox(height: 4,),
       Column(
         spacing: 5,
         children: [
          Row(

            children: [


               Row(
         children: [
           ListingIcon(
        iconData: Icons.location_on_outlined,
           ),
       
       SizedBox(width: 5,),
           SizedBox(
            width: itemWidth*.25,

             child: Text(
               postModel!.city==null?
               '':
              postModel!.city!.name.toString()
              
              ,
             maxLines: 2,
              overflow: TextOverflow.ellipsis
             
              
               ,style: TextStyle(
                     color: Colors.grey , 
                                          fontWeight: FontWeight.w600,

                     fontSize: 10
             ),),
           )
       
       
       
       
       
         ],
       )
       
       
       
       , 
       
       
       Row(
         children: [
           ListingIcon(
        iconData: Icons.schedule,
           ),
       
       SizedBox(width: 5,),
           SizedBox(
            width:  itemWidth*.30,
            
             child: Text(postModel!.createdAtFormatted.toString() ,
             maxLines: 1,
              overflow: TextOverflow.ellipsis
             ,style: TextStyle(
              fontSize: 10,
                     color: Colors.grey, 
                     fontWeight: FontWeight.w600
             ),),
           )
       
       
       
       
           
         ],
       )
       
            ],
          )
       
       , 
       
       Row(
         children: [
           ListingIcon(
        iconData: Icons.person_outline,
           ),
       
       SizedBox(width: 5,),
           SizedBox(
            width: itemWidth*.70,
             child: Text(postModel!.contactName.toString()
             ,maxLines: 1,overflow: TextOverflow.ellipsis
              ,style: TextStyle(
                fontSize: 10,
                     color: Colors.grey, 

                                          fontWeight: FontWeight.w600

             ),),
           )
       
       
       
       
           
         ],
       )
       
       
         ],
       )
       
       
       
             ],
       ),
       
       )
       
         ],
       ),
       
       
       ),
     )
    , crossFadeState: 
    isList!?CrossFadeState.showFirst: 
    CrossFadeState.showSecond, duration: Duration(milliseconds: 500));
  }
}
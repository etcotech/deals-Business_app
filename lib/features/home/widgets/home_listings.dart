import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:deals_and_business/features/home/widgets/listing_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeListings extends StatefulWidget {
  const HomeListings({super.key});

  @override
  State<HomeListings> createState() => _HomeListingsState();
}

class _HomeListingsState extends State<HomeListings> {
  bool isList= true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;    
/*24 is for notification bar on Android*/
final double itemHeight = (size.height - kToolbarHeight - 24) *.50; 
final double itemWidth = size.width*.45;
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




isList?

ListView( shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
                  
                children: provider.posts.map((post)=>  HomePost(
                  isList: true,postModel: post,
                )).toList(),):
                GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 0,
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
              ],
            ),
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
final double itemHeight = (size.height - kToolbarHeight - 24) *.50; 
final double itemWidth = size.width*.45;
    return AnimatedCrossFade(firstChild: 
    SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height/6,
  
  
      child: Card(
        color: Colors.white,
            semanticContainer: true,
        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
      
        ),
      child:
       Container(width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height/6,
      padding: EdgeInsets.all(5),          child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(postModel!.picture!.url!.medium!, 
          width:    MediaQuery.sizeOf(context).width*.30,
              height: MediaQuery.sizeOf(context).height/6,
            fit: BoxFit.cover,
              ),
              
              ),
        SizedBox(width: 5,),
        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
            Text(postModel!.createdAtFormatted!.toString(), 
            style: TextStyle(
              color: Colors.grey
            ),
            )
          ],
        )
        


        
                 ,SizedBox(height: 6,)

              ],
            )
          ],
        ), 
        
        
        // Icon(Icons.more_vert_outlined, color: Colors.grey,)
        PopupMenuButton(

          menuPadding: EdgeInsets.zero,

            onSelected: (choice){

            },
            padding: EdgeInsets.zero,
            // initialValue: choices[_selection],
            itemBuilder: (BuildContext context) {
              return ['Report'].map((String choice) {
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
      
      ))
    
    
    , secondChild: 
    
     Card(
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
                    height:   itemHeight*.50,
           width:       itemWidth,

           child: Stack(
             children: [
               SizedBox(
                    height:   itemHeight*.60,
           width:    itemWidth,
                 child: ClipRRect(
                                 borderRadius: BorderRadius.circular(15.0),
                                 child: Image.network(postModel!.picture!.url!.medium!, 
                                 
                 fit: BoxFit.cover,
                 scale: 5,

                                 )),
               ),
           
                 PositionedDirectional(
                   bottom: 10,
                   start: 5,
                   child: Visibility(
                     visible: postModel!.featured==0,
                     child: Icon(Icons.bookmark , color: Colors.green,)))
             ],
           ),
         )
     ,
     SizedBox(height: 8,),
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
    ListingIcon(
      iconData: Icons.location_on_outlined,
    ),

SizedBox(width: 5,),
    Text(postModel!.cityId.toString() ,style: TextStyle(
      color: Colors.grey
    ),)





  ],
)



, 


Row(
  children: [
    ListingIcon(
      iconData: Icons.schedule,
    ),

SizedBox(width: 5,),
    Text(postModel!.createdAtFormatted.toString() ,style: TextStyle(
      color: Colors.grey
    ),)




    
  ],
)


, 

Row(
  children: [
    ListingIcon(
      iconData: Icons.person_outline,
    ),

SizedBox(width: 5,),
    Text(postModel!.contactName.toString() ,style: TextStyle(
      color: Colors.grey
    ),)




    
  ],
)


  ],
)



           ],
     ),
     
     )
     
       ],
     ),
     
     
     )
    , crossFadeState: 
    isList!?CrossFadeState.showFirst: 
    CrossFadeState.showSecond, duration: Duration(milliseconds: 500));
  }
}
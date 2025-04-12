import 'package:cached_network_image/cached_network_image.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/category/category_subcategoory_model.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/features/category/providers/category_provider.dart';
import 'package:deals_and_business/features/category/widgets/sub_category_widget.dart';
import 'package:deals_and_business/features/home/widgets/listing_icon.dart';
import 'package:deals_and_business/features/posts/views/post_details_screen.dart';
import 'package:deals_and_business/features/report/views/report_screen.dart';
import 'package:deals_and_business/shared/views/post_preview_image_widget.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/error_container.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SubcategoryDetailsScreen extends StatefulWidget {
  final CategorySubcategoryModel? categoryModel;
  final String? categoryId;
    final String? title;

  const SubcategoryDetailsScreen({super.key, this.categoryModel, this.categoryId, this.title});

  @override
  State<SubcategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<SubcategoryDetailsScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){

   context.read<CategoryProvider>().getSubCategoryPosts(widget.categoryId!);

    });
  }

  @override
  Widget build(BuildContext context) {

     var size = MediaQuery.of(context).size;    
/*24 is for notification bar on Android*/
final double itemHeight = (size.height - kToolbarHeight - 24) *.35; 
final double itemWidth = size.width*.43;
    return Consumer<CategoryProvider>(builder: (context,provider,child){

if (provider.isLoading) {
  return Scaffold(
    body: SizedBox.expand(
      child: Center(child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),),
    ),
  );
}

else if(provider.errorData!=null){
return Scaffold(
    body: SizedBox.expand(
      child: Center(

child: ErrorContainer(
  onRetry: (){
   context.read<CategoryProvider>().getCategoryPosts(widget.categoryModel!.id.toString());
  },
  onLogin: (){


  },
  errorData: 
  provider.errorData!),

      ),
    ),
  );

}

else {

return Scaffold(

appBar: AppBar(
  backgroundColor: Colors.transparent, 
leading: MyBackButton(
  onTap: (){
    Navigator.of(context).pop();
  },
),
centerTitle: true,
  title: Text(
    widget.title.toString(), 
    style: TextStyle(
      fontWeight: FontWeight.bold
    ),
  ),

),

body: SizedBox.expand(
  child: SingleChildScrollView(
   
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    SizedBox(height: 16,),
    

    Padding( padding: EdgeInsets.symmetric(
      horizontal: 15
    ),
    
    child: Text(
      "${getTranslated(Strings.subCategoriesIn, context)!} ${widget.title}", 
style: TextStyle(
  fontWeight: FontWeight.bold, 
  fontSize: 14
),


    ),
    ), 
  
SizedBox(height: 16,),
provider.subCategoryposts.isEmpty?

Center(child: Text("${getTranslated(Strings.noPostIncategory , context)!}  (${widget.categoryModel!.name})" ,
style: TextStyle(
  color: Colors.grey, 
  fontWeight: FontWeight.bold
),
),
):
   SizedBox(height: 16,),

    // ListView.builder(
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   itemCount: provider.categoryPosts.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     var post = provider.categoryPosts[index];
    //     return CategoryPost(postModel: post);
    //   },
    // )
      Padding(
     padding: EdgeInsets.symmetric(horizontal: 18), 
        child: GridView.count(
                    // controller: _gridtScrollController,
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
                  
                  children: provider.subCategoryposts.map((post)=>  CategoryPost(
                    // isList: false,
                    postModel: post,
                  )).toList(),
        // itemBuilder: (context, index) {
        //   var post =  provider.posts[index];
        //   return   HomePost(
        //                   isList: false,postModel: post,
        //                 );
        // },
        
        
                  ),
      ) 
     
    
      ],
    ),
  ),
),
);
}

    });
}

}


class CategoryPost extends StatelessWidget {
   final PostModel? postModel;
  const CategoryPost({super.key, this.postModel});

  @override
  Widget build(BuildContext context) {
         var size = MediaQuery.of(context).size;    
/*24 is for notification bar on Android*/
final double itemHeight = (size.height - kToolbarHeight - 24) *.35; 
final double itemWidth = size.width*.43;



    return 
    
    
    
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
                      height:   itemHeight*.60,
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
                                    
                                           imageUrl:postModel!.pictureUrlBig,
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
     );
   
    
    
    
     GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          PageTransition(type: PageTransitionType.rightToLeft, child: PostDetailsScreen(
            postId: postModel!.id.toString(),
          ))
        );
      },
      child: SizedBox(
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

PostPreviewImageWidget(imageUrl: postModel!.pictureUrlBig, postId: postModel!.id,),
            /*
             ClipRRect(
               borderRadius: BorderRadius.circular(15.0),
            
               child:
       postModel!.pictureUrlBig==null?
               Center(child: Icon(Icons.image,size: 50 ,color: Colors.grey,),):
                Image.network(
                 errorBuilder: (context, error, stackTrace) {
                   
            return Center(child: Icon(Icons.image,size: 50 ,color: Colors.grey,),);
                 },
                  postModel!.pictureUrlBig.toString(), 
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
             Text(postModel!.createdAtFormatted.toString(), 
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
         
         
      //    // Icon(Icons.more_vert_outlined, color: Colors.grey,)
      //    PopupMenuButton(
            
      //      menuPadding: EdgeInsets.zero,
            
      //        onSelected: (choice){
      //       Navigator.of(context).push(
      //  PageTransition(type: 
       
      //  PageTransitionType.leftToRight ,child: ReportScreen(
      
      //    postId: postModel!.id.toString(),
      //  )
      //  )
      //       );
      //        },
      //        padding: EdgeInsets.zero,
      //        // initialValue: choices[_selection],
      //        itemBuilder: (BuildContext context) {
      //          return ['Report'].map((String choice) {
      //            return  PopupMenuItem<String>(
      //            value: choice,
      //            child: Text(getTranslated(choice, context)!, 
      //          style: TextStyle(
      //            color: Colors.grey
      //          ),
      //            ),
      //          );}
      //          ).toList();
      //        },
      //      position: PopupMenuPosition.under,
            
           
      //      ), 
            
         
           ],
         ),
       ),
       
       )),
    );
  }
}
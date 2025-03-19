import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/category/category_subcategoory_model.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/features/category/providers/category_provider.dart';
import 'package:deals_and_business/features/category/widgets/sub_category_widget.dart';
import 'package:deals_and_business/features/home/widgets/listing_icon.dart';
import 'package:deals_and_business/features/report/views/report_screen.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/error_container.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final CategorySubcategoryModel? categoryModel;
  const CategoryDetailsScreen({super.key, this.categoryModel});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){

   context.read<CategoryProvider>().getCategoryPosts(widget.categoryModel!.id.toString());

    });
  }

  @override
  Widget build(BuildContext context) {
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
  title: Text(
    widget.categoryModel!.name.toString(), 
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
      "${getTranslated(Strings.subCategoriesIn, context)!} ${widget.categoryModel!.name}", 
style: TextStyle(
  fontWeight: FontWeight.bold, 
  fontSize: 14
),


    ),
    ), 
    
    
    SizedBox(height: 16,),
    
    
    SizedBox(
    width: MediaQuery.sizeOf(context).width,
     height:  MediaQuery.sizeOf(context).width*.29,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true ,
      itemCount:widget.categoryModel!.children!.length,
      itemBuilder: (context ,index){
        var SubCategory= widget.categoryModel!.children![index];
        return Center(
          child: SubCategoryWidget(
            title: SubCategory.name
          ),
        );
      
    
    
    }),
    )
    , 

    ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: provider.posts.length,
      itemBuilder: (BuildContext context, int index) {
        var post = provider.posts[index];
        return CategoryPost(postModel: post);
      },
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
    return   SizedBox(
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
           ClipRRect(
             borderRadius: BorderRadius.circular(15.0),
          
             child:
//  postModel?.picture?.url?.big==null?
//              Center(child: Icon(Icons.image,size: 50 ,color: Colors.grey,),):
              Image.network(
               errorBuilder: (context, error, stackTrace) {
                 
          return Center(child: Icon(Icons.image,size: 50 ,color: Colors.grey,),);
               },
                postModel!.picture?.url?.big??'', 
         width:    MediaQuery.sizeOf(context).width*.30,
             height: MediaQuery.sizeOf(context).height/7,
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
       
       
       // Icon(Icons.more_vert_outlined, color: Colors.grey,)
       PopupMenuButton(
          
         menuPadding: EdgeInsets.zero,
          
           onSelected: (choice){
          Navigator.of(context).push(
     PageTransition(type: 
     
     PageTransitionType.leftToRight ,child: ReportScreen(
    
       postId: postModel!.id.toString(),
     )
     )
          );
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
     
     ));
  }
}
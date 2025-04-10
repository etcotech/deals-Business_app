import 'package:dartz/dartz.dart' show Either;
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/post/post_details_response_model.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:deals_and_business/features/home/widgets/listing_icon.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/views/post_preview_image_widget.dart';
import 'package:deals_and_business/shared/widgets/app_drawer.dart';
import 'package:deals_and_business/shared/widgets/countries_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/error_container.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  final bool? asGuest;
  const FavouriteScreen({super.key, this.asGuest=false});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
context.read<PostProvider>().getFavouritePosts();


    });
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,
backgroundColor:

 Colors.white,
      appBar: 
      
      MyAppBar(context,
      currentCountry: 'assets/images/ksa.png',
      title: getTranslated(Strings.favourite, context),
        onTapDrawer: (){
          scaffoldKey.currentState!.openDrawer();
        },
        onCountryTap: (){
  showModalBottomSheet(
              context: context,
              isDismissible: false, // Prevent dismissal
              enableDrag: false, // Prevent dragging to dismiss
              backgroundColor: Colors.transparent, // Make background transparent
              builder: (context) {
                return CountriesBottomsheet(
                   onSelectCountry: (country){
                    context.read<HomeProvider>().saveCountryData(country);
                  },
                );
              },
            );
        }, 
        isGuest: widget.asGuest!
      ),

drawer: AppDrawer(),
drawerEnableOpenDragGesture: false, 
body: Consumer<PostProvider>(builder: (context, provider, child){

if (provider.isLoading) {
  return SizedBox.expand(
    child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),),
  );
}
if (provider.favouritePosts.isEmpty) {
  return SizedBox.expand(
    child: Center(child: Text(getTranslated(Strings.noPosts, context)!),),
  );
}
if (provider.error!=null) {
  return SizedBox.expand(
    child: Center(child: ErrorContainer(
onLogin: (){
   Navigator.of(context).pushAndRemoveUntil(

          PageTransition(type: PageTransitionType.fade , 
          
          
          child: LoginScreen()), 
          (_)=> false
        );
},
onRetry: (){
  context.read<PostProvider>().getFavouritePosts();

},
      errorData: provider.errorData,
    )),
  );
}

return SizedBox.expand(

  child: ListView.builder(
    shrinkWrap: true,
    itemCount: provider.favouritePosts.length,
    itemBuilder: (BuildContext context, int index) {
      var post = provider.favouritePosts[index];
      // return 

      // ListTile(
      //   title: Text(post.postId.toString()),
      // );
      return FavouritePoast(postId: post.postId.toString(),);
    },
  ),
);


}),

    );
  }
}




class FavouritePoast extends StatefulWidget {
  final String? postId;
  const FavouritePoast({super.key, this.postId});

  @override
  State<FavouritePoast> createState() => _FavouritePoastState();
}

class _FavouritePoastState extends State<FavouritePoast> {

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){


// context.read<PostProvider>().getPost(widget.postId!);

    });
  }


  @override
  Widget build(BuildContext context) {
var size = MediaQuery.of(context).size;    
final double itemHeight = (size.height - kToolbarHeight - 24) *.50; 
final double itemWidth = size.width*.45;
    final postProvider = Provider.of<PostProvider>(context); 
WidgetsBinding.instance.addPostFrameCallback((_){


// context.read<PostProvider>().getPost(widget.postId!);
    postProvider.getPostDetails(widget.postId!)  ;

    });
     return 
    
    Consumer<PostProvider>(
      builder: (context, provider,child) {


       
        if (provider.isItemLoading(int.parse(widget.postId!))) {

          return SizedBox(   width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height/7,child: Center(child: CircularProgressIndicator()));
                    return SizedBox();

        }
        if (provider.errorData!=null) {
          return Text(provider.errorData!.message.toString());
          return SizedBox();
        }
         else{

             final item = postProvider.getItem(int.parse(widget.postId!));
             if (item == null) {
               return SizedBox();
               
             }
        return
        
        
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
PostPreviewImageWidget(imageUrl:item.picture!.url!.big!, postId: item.id,),
              /*
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
      
                child:
                 Image.network(
                  errorBuilder: (context, error, stackTrace) {
                    
      return Center(child: Icon(Icons.image ,color: Colors.grey,),);
                  },
                 item!.picture!.url!.big!, 
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
                              child: Text(item.category!.name.toString(), 
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
            child: Text(item.title!, 
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
              Text( item.createdAtFormatted!.toString(), 
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
 


 IconButton(onPressed: (){
provider.addPostToFavourite(context, widget.postId!);
  //
 }, icon: Icon(Icons.bookmark , color: Colors.green,))
      
          
            ],
          ),
        ),
        
        ));
   
         }
      
      }
    );
    
    
  
  }
}
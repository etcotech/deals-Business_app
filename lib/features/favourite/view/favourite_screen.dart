import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/home/widgets/listing_icon.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/app_drawer.dart';
import 'package:deals_and_business/shared/widgets/countries_bottomsheet.dart';
import 'package:flutter/material.dart';
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
                return CountriesBottomsheet();
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
    child: Center(child: Text(provider.error.toString(),)),
  );
}

return SizedBox.expand(

  child: ListView.builder(
    shrinkWrap: true,
    itemCount: provider.favouritePosts.length,
    itemBuilder: (BuildContext context, int index) {
      var post = provider.favouritePosts[index];
      return FavouritePoast(postModel: post,);
    },
  ),
);


}),

    );
  }
}




class FavouritePoast extends StatelessWidget {
  final PostModel? postModel;
  const FavouritePoast({super.key, this.postModel});

  @override
  Widget build(BuildContext context) {
var size = MediaQuery.of(context).size;    
final double itemHeight = (size.height - kToolbarHeight - 24) *.50; 
final double itemWidth = size.width*.45;
    return 
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
      
      ));
    
    
  
  }
}
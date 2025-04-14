import 'package:cached_network_image/cached_network_image.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:deals_and_business/features/home/widgets/listing_icon.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/features/report/views/report_screen.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/add_to_favourite_button.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/contact_with_us_button.dart';
import 'package:deals_and_business/shared/widgets/delete_account_alert.dart';
import 'package:deals_and_business/shared/widgets/error_container.dart';
import 'package:deals_and_business/shared/widgets/main_button_with_icon.dart';
import 'package:deals_and_business/shared/widgets/not_authenticated_alert_dialog.dart';
import 'package:deals_and_business/shared/widgets/report_button.dart';
import 'package:deals_and_business/shared/widgets/send_options_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PostDetailsScreen extends StatefulWidget {
  final String? postId;
  const PostDetailsScreen({super.key, this.postId});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
    final PageController _pageController = PageController();
  bool _isCarouselVisible = true;
  double _dragStartPosition = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
context.read<PostProvider>().getPost(widget.postId!);

    });
  }


  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<ProfileProvider>(context);

    var homeProvider= Provider.of<HomeProvider>(context);
    return  Consumer<PostProvider>(
            builder: (context,provider,child) {

              if (provider.isLoading) {
                return SizedBox.expand(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(
                        color : Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                );
              }
                else if (provider.error!=null) {
                return Scaffold(
    body: SizedBox.expand(
      child: Center(

child: ErrorContainer(
  onRetry: (){
context.read<PostProvider>().getPost(widget.postId!);
  },
  onLogin: (){


  },
  errorData: 
  provider.errorData!),

      ),
    ),
  );

              }
     // ignore: curly_braces_in_flow_control_structures
     else    return Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: MyBackButton(
          onTap: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          ReportButton(
            isDelete: provider.postDetailsModel!.userId.toString()
            == userProvider.getUserId()
            ,
            onDelete: (){
               showDialog(context: context,
       builder: (_)=> DeleteAccountAlert(
        isDelete: true, 
        onConfirm: (){
provider.delete(context,  provider.postDetailsModel!.id.toString(),
 (){
homeProvider.refreshPosts(context);
Navigator.pop(context);
 });
        },
        title: getTranslated(Strings.areYouSureDeletePost, context),
       ));

            },
            onTap: (){
              Navigator.of(context).push(
        PageTransition(type: 
        
        PageTransitionType.leftToRight ,child: ReportScreen(

                    postId: provider.postDetailsModel!.id.toString(),

        )
        )
      );
            },
          )
        ],
          ),
        
          body: Consumer<PostProvider>(
            builder: (context,provider,child) {
            
              return SizedBox.expand(
              
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
SizedBox(height: 16,),
SizedBox(

   width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height*.35,
  child: GestureDetector(
    onVerticalDragStart: (details) {
            _dragStartPosition = details.globalPosition.dy;
          },
          onVerticalDragUpdate: (details) {
            final dragDistance = details.globalPosition.dy - _dragStartPosition;
            if (dragDistance > 20 && _isCarouselVisible) {
              setState(() => _isCarouselVisible = false);
            } else if (dragDistance < -20 && !_isCarouselVisible) {
              setState(() => _isCarouselVisible = true);
            }
          },
  
  
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
    child: Stack(
      children: [
  
        /*
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height*.35,
        
          child:
          
          Hero(tag: 
          
          
           provider.postDetailsModel!.picture!.url!.full.toString()
          
          
          ,
            child: CachedNetworkImage(
            imageUrl:  provider.postDetailsModel!.picture!.url!.full!,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height*.35,fit: BoxFit.fill,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.photo_camera_outlined,size:100),
            ),
          )
          
          //  Image.network(
          //   provider.postDetailsModel!.picture!.url!.full!,
          
          //  width: MediaQuery.sizeOf(context).width,
          //   height: MediaQuery.sizeOf(context).height*.35,fit: BoxFit.fill,
          
          
          // ),
        ),
     
  */
     
     AnimatedPositioned(
        // width: MediaQuery.sizeOf(context).width,
        //     height: MediaQuery.sizeOf(context).height*.35,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: _isCarouselVisible ? 0 : -200,
                // left: 0,
                // right: 0,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height*.35,
                  color: Colors.black.withOpacity(0.8),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: provider.postDetailsModel!.pictures!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle image tap if needed
                        },
                        child: Hero(
                          tag: provider.postDetailsModel!.pictures![index].url!.full.toString(),
                          child: CachedNetworkImage(
                            imageUrl: provider.postDetailsModel!.pictures![index].url!.full!,
                          width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height*.35,fit: BoxFit.fill,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.white),
                          ),
                        ),
                      );
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            provider.postDetailsModel!.pictures![index].url!.full!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(Icons.error, color: Colors.white),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
     if (_isCarouselVisible)
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(provider.postDetailsModel!.pictures!.length, (index) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _pageController.hasClients
                              ? (_pageController.page?.round() == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5))
                              : Colors.white.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                ),
                    
     
      ],
    ),
    
    
    
    ),
  ),
), 

SizedBox(height: 16,),

Container(
  padding: EdgeInsets.all(10),
   width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height*.15,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white, 
     boxShadow: [
             BoxShadow(
                offset: Offset(0, 0),
                color: Colors.grey[300]!,
                blurRadius: 1,
                spreadRadius: 1
              )
            ]
  ),
  child: 
  /*
  Column(
    children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [


 Text(provider.postDetailsModel!.title.toString() , 
  style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.w500
  ),
  ),
ContactWithUsButton(
    price: provider.postDetailsModel!.price,
   )

  ],
)
, 
Spacer(),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [



Row(
  // crossAxisAlignment: CrossAxisAlignment.start,
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  mainAxisSize: MainAxisSize.min,
  spacing: 8,
  children: [
    
       Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(spacing:5, children: [
            ListingIcon(
            iconData: Icons.person_outline,
          ),
          SizedBox(
            width: 200,
            child: Text(
               provider.postDetailsModel!.user != null?
              provider.postDetailsModel!.user!.name.toString()
              :'', 
              overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey
            ),
            ),
          ), 
          
          
          ],)
          ,
          Row(

            spacing:5,
            children: [ ListingIcon(
            iconData: Icons.list,
          ),
          Text(provider.postDetailsModel!.categoryId.toString(), 
          style: TextStyle(              fontSize: 12,

            color: Colors.grey
          ),
          ), 
      ],
          )
        ],
      ),
     
       Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            spacing: 5,
            children: [
ListingIcon(
            iconData: Icons.schedule,
          ),
          Text(provider.postDetailsModel!.createdAtFormatted.toString(), 
          style: TextStyle(              fontSize: 10,

            color: Colors.grey
          ),
          ), 
          ],), 



          Row(
            spacing: 5,
            children: [
               ListingIcon(
            iconData: Icons.location_on_outlined,
          ),
          Text(provider.postDetailsModel!.cityId.toString(), 
          style: TextStyle(              fontSize: 10,

            color: Colors.grey
          ),
          ),
            ],
          ) 
        ],
      )
 
  ],
)



  // ],)
   ,



    ],
  )
 */ 


  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
Expanded(
  // flex: 1,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
  Text(provider.postDetailsModel!.title.toString() , 
  style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold
  ),
  ), 

  
  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      
         Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(spacing:5, children: [
              ListingIcon(
              iconData: Icons.person_outline,
            ),
            Text(
               provider.postDetailsModel!.user != null?
              provider.postDetailsModel!.user!.username .toString()
              :'', 
              // overflow: TextOverflow.ellipsis,
            style: TextStyle(              fontSize: 10,
            
              color: Colors.grey
            ),
            ), 
            
            
            ],)
            ,
            Row(

              spacing:5,
              children: [ ListingIcon(
              iconData: Icons.list,
            ),
            Text(provider.postDetailsModel!.categoryId.toString(), 
            style: TextStyle(              fontSize: 11,

              color: Colors.grey
            ),
            ), 
        ],
            )
          ],
        ),
       
         Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              spacing: 5,
              children: [
ListingIcon(
              iconData: Icons.schedule,
            ),
            Text(provider.postDetailsModel!.createdAtFormatted.toString(), 
            style: TextStyle(              fontSize: 10,

              color: Colors.grey
            ),
            ), 
            ],), 



            Row(
              spacing: 5,
              children: [
                 ListingIcon(
              iconData: Icons.location_on_outlined,
            ),
            Text(provider.postDetailsModel!.cityId.toString(), 
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey
            ),
            ),
              ],
            ) 
          ],
        )
   
    ],
  )
  
  
  
    ],),
)
   ,
   
   
   ContactWithUsButton(
    price: provider.postDetailsModel!.price,
   )
   
   
    ],
  ),










  
)
,
SizedBox(height: 16,),
Text(getTranslated(Strings.details, context)!,
style: TextStyle(
  fontSize: 15,fontWeight: FontWeight.bold
),
),

SizedBox(height: 16,),

Container(
  padding: EdgeInsets.all(8),
   width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height*.20,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white, 
     boxShadow: [
             BoxShadow(
                offset: Offset(0, 0),
                color: Colors.grey[300]!,
                blurRadius: 1,
                spreadRadius: 1
              )
            ]
  ),
  child: SizedBox(
     width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height*.20,
    
    child: Text(provider.postDetailsModel!.description.toString(),
    overflow: TextOverflow.ellipsis,
    maxLines: 100,
    textAlign: TextAlign.start,
    style: TextStyle(
      color: Colors.grey ,
      fontSize: 15,
      
    ),
    ),
  ),

),
SizedBox(height: 16,),
Text(getTranslated(Strings.location, context)!,
style: TextStyle(
  fontSize: 15,fontWeight: FontWeight.bold
),
),

SizedBox(height: 16,),

//map

ClipRRect(
  borderRadius: BorderRadius.circular(15),
child: SizedBox(
  width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height*.35,
child: GoogleMap(
  
  zoomControlsEnabled: true,
  zoomGesturesEnabled: true,
  markers: {
    Marker(markerId: MarkerId('city'), 
    
    position: LatLng(
    provider.postDetailsModel!.city!.latitude!=null?
    double.parse(provider.postDetailsModel!.city!.latitude.toString())
    :0.0,
     
     provider.postDetailsModel!.city!.longitude!=null?
     double.parse(provider.postDetailsModel!.city!.longitude.toString()):0.0)
    )
  },
  initialCameraPosition: 

CameraPosition(
  zoom: 10,
  target: LatLng(
     provider.postDetailsModel!.lat!=null?
     double.parse( provider.postDetailsModel!.lat.toString()):
   0.0,
  

   provider.postDetailsModel!.lon!=null?
   double.parse( provider.postDetailsModel!.lon.toString()):
0.0)
)
),

)
)




                ],),)
              );
            }
          ),
          
          
          bottomNavigationBar:Container(
height: 100,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(radius)
            ),
            child: Row(
              children: [
                Expanded(
                  child: MainButtonWithIcon(
                    color: Theme.of(context).primaryColor,
                  
                    icon: Icons.mail_outline,
                    title: getTranslated(Strings.contactWithSeller, context),
                    onTap: (){

//
showModalBottomSheet(
              context: context,
              isDismissible: true, // Prevent dismissal
              enableDrag: false, // Prevent dragging to dismiss
              backgroundColor: Colors.transparent, // Make background transparent
              builder: (context) {
                return SendOptionsBottomSheet(
                  postEmail: provider.postDetailsModel!.email,
                  postId: provider.postDetailsModel!.id.toString(),
                );
              },
            );



                    },
                    isLoading: false,
                  ),
                ),
                SizedBox(width: 5,),


                AddToFavouriteButton(
                  isFavourite: provider.isFavourite,
                  onTap: (){
if (  context.read<HomeProvider>().isLoggedIn()) {
                      context.read<PostProvider>().addPostToFavourite(context,widget.postId!.toString());
return;
}

                    showDialog(context: context,
                    barrierDismissible: true,
                     builder: (context){

return  NotAuthenticatedAlertDialog();
                     });
                  },
                )
              ],
            ),
          )
        
        
        
        );
      }
    );
  }
}
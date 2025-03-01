import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/home/widgets/listing_icon.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/add_to_favourite_button.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/contact_with_us_button.dart';
import 'package:deals_and_business/shared/widgets/main_button_with_icon.dart';
import 'package:deals_and_business/shared/widgets/not_authenticated_alert_dialog.dart';
import 'package:deals_and_business/shared/widgets/report_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PostDetailsScreen extends StatefulWidget {
  final String? postId;
  const PostDetailsScreen({super.key, this.postId});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {

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
                if (provider.error!=null) {
                return Scaffold(
                  body: SizedBox.expand(
                    child: Center(
                      child: Text(
                      provider.error.toString()
                      ),
                    ),
                  ),
                );
              }
        return Scaffold(
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
ClipRRect(
  borderRadius: BorderRadius.circular(15),
child: SizedBox(
  width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height*.35,

  child: Image.network(provider.postDetailsModel!.picture!.url!.full!,
  
   width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height*.35,fit: BoxFit.fill,
  
  
  ),
),



), 

SizedBox(height: 8,),

Container(
  padding: EdgeInsets.all(8),
   width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height*.18,
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
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
  Text(provider.postDetailsModel!.title.toString() , 
  style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.w500
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
            Text(provider.postDetailsModel!.user.toString(), 
            style: TextStyle(
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
            style: TextStyle(
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
            style: TextStyle(
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
   ,ContactWithUsButton()
   
   
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
  padding: EdgeInsets.all(5),
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
    
    position: LatLng(provider.postDetailsModel!.lat??0.0,
     provider.postDetailsModel!.lon??0.0)
    )
  },
  initialCameraPosition: 

CameraPosition(
  target: LatLng(provider.postDetailsModel!.lat??0.0, provider.postDetailsModel!.lon??0.0)
)
),

)
)




                ],),)
              );
            }
          ),
          
          
          bottomNavigationBar:Container(
height: 60,
            padding: EdgeInsets.all(5),
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
                    onTap: (){},
                    isLoading: false,
                  ),
                ),
                SizedBox(width: 5,),


                AddToFavouriteButton(
                  isFavourite: provider.isFavourite,
                  onTap: (){

                    context.read<PostProvider>().addPostToFavourite(context,widget.postId!.toString());

//                     showDialog(context: context,
//                     barrierDismissible: true,
//                      builder: (context){

// return  NotAuthenticatedAlertDialog();
//                      });
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
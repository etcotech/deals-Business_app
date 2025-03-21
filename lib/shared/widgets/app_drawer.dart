import 'package:cached_network_image/cached_network_image.dart';
import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/auth/providers/auth_provider.dart';
import 'package:deals_and_business/features/contact/views/contact_with_admins_screen.dart';
import 'package:deals_and_business/features/favourite/view/favourite_screen.dart';
import 'package:deals_and_business/features/language/view/language_screen.dart';
import 'package:deals_and_business/features/posts/views/add_post_screen.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/features/profile/views/profile_screen.dart';
import 'package:deals_and_business/features/settings/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
      var authProvider = Provider.of<AuthProvider>(context);
      var profileProvider = Provider.of<ProfileProvider>(context);

    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
          child: ListView(
            // padding: EdgeInsets.zero,
            children: [
             Container(
              height: MediaQuery.sizeOf(context).height/4,
              decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                ),
                child: Center(
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: profileProvider.getUserPhoto()!,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white ,
                            shape: BoxShape.circle
                          ),
                          child: CircleAvatar(radius: 40,
                          backgroundColor: Colors.grey[300],
                        backgroundImage: profileProvider.getUserPhoto()!.isEmpty?
                        AssetImage(Images.user):
                        CachedNetworkImageProvider(profileProvider.getUserPhoto()!),
                        //  NetworkImage( profileProvider.getUserPhoto()!)
                        // ,
                        
                        
                          // child: Icon(Icons.person , color: Colors.white,size: 40,),
                          ),
                        ),
                      ),
                      Text(profileProvider.getUserName())
                    ],
                  ),
                ),
             )
              // , 
              // drawerItem(context, Icons.person_outline, getTranslated('profile', context)!, (){

              // })
              
              // ,
              //  drawerItem(context, Icons.add, getTranslated('add_post', 
              //  context)!, (){

              // })
              
              ,
              ListTile(
                leading:  Icon(Icons.person_outline , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('profile', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                  Navigator.push(context,
                  PageTransition(type: PageTransitionType.fade ,child:  
    ProfileScreen()));
                },
              ),


  ListTile(
                leading:  Icon(Icons.add , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('add_post', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                 Navigator.push(context,
                  PageTransition(type: PageTransitionType.fade ,child:  
    AddPostScreen()));
 
                },
              ),


  ListTile(
                leading:  Icon(Icons.favorite , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('favourite_posts', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                   Navigator.push(context,
                  PageTransition(type: PageTransitionType.fade ,child:  
    FavouriteScreen(
      asGuest: true,
    )));
                },
              ),

          
              
  ListTile(
                leading:  Icon(Icons.pending , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('pending_posts', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const MyHomePage(
                  //       title: 'Houses',
                  //     ),
                  //   ),
                  // );
                },
              ),

              
 ListTile(
                leading:  Icon(Icons.archive , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('archive_posts', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const MyHomePage(
                  //       title: 'Houses',
                  //     ),
                  //   ),
                  // );
                },
              ),

     ListTile(
                leading:  Icon(Icons.mail_outline , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('contact_with_admins', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                 Navigator.push(context,
                  PageTransition(type: PageTransitionType.fade ,child:  
    ContactWithAdminsScreen()));
                },
              ),

          ListTile(
                leading:  Icon(Icons.translate_outlined , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('change_language', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                    Navigator.push(context,
                  PageTransition(type: PageTransitionType.fade ,child:  
    LanguageScreen(
      fromSplash: false,
    )));
                },
              ),
 ListTile(
                leading:  Icon(Icons.settings , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('settings', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                   Navigator.push(context,
                  PageTransition(type: PageTransitionType.fade ,child:  
    SettingsScreen()));
                },
              ),
authProvider.isLoading?
Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),)
:
         ListTile(
                leading:  Icon(Icons.logout , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('logout', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {

                  authProvider.signOut(context);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const MyHomePage(
                  //       title: 'Houses',
                  //     ),
                  //   ),
                  // );
                },
              ),

        Divider(color: Colors.grey,)
        , 

        SizedBox(height: 8,),

         ListTile(
                leading:  Icon(Icons.share , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('share_app', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const MyHomePage(
                  //       title: 'Houses',
                  //     ),
                  //   ),
                  // );
                },
              ),

         ListTile(
                leading:  Icon(Icons.thumb_up , 
                color: Theme.of(context).primaryColor,
                
                ),
                title:  Text(
                 getTranslated('rate_app', context)!,
                  style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold),
                
                ),
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const MyHomePage(
                  //       title: 'Houses',
                  //     ),
                  //   ),
                  // );
                },
              ),

        
           


            ],
          )
    );
  }


  drawerItem(BuildContext context, IconData icon , String title , Function? onTap, {bool? isLoading=false}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.sizeOf(context).width,

      child: 
      isLoading!?
      Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),)
      :
      Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
      children: [
        Icon(icon, 
        color: Theme.of(context).primaryColor 
        // ,size: 20,
        
        ),
Text(title ,style: TextStyle(
  fontSize: 14, fontWeight: FontWeight.bold, 

), )
      ],
      ),
    );
  }
}
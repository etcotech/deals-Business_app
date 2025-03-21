import 'dart:developer';

import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/favourite/view/favourite_screen.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:deals_and_business/features/home/view/home_screen.dart';
import 'package:deals_and_business/features/messages/views/messages_screen.dart';
import 'package:deals_and_business/features/posts/views/add_post_screen.dart';
import 'package:deals_and_business/features/search/views/advance_search_screen.dart';
import 'package:deals_and_business/shared/widgets/not_authenticated_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  final bool? asGuest;
  const Dashboard({super.key, this.asGuest =false});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   int _selectedPage=0;

  late List<Widget> _screens;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screens =[

      HomeScreen(asGuest: widget.asGuest,),

            FavouriteScreen(asGuest: widget.asGuest,),  //white
Container(),

          AdvanceSearchScreen(asGuest: widget.asGuest,), 

      MessagesScreen(asGuest: widget.asGuest,)
    ];
  }


  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,



body: _screens[_selectedPage],

floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

floatingActionButton: FloatingActionButton(
  
  shape:CircleBorder(),
  backgroundColor: Theme.of(context).primaryColor,
  onPressed: (){

     if (homeProvider.isLoggedIn()) {
   
  setState(() {
      
    });
  }else{
    showDialog(context: context, builder: (_){


      return NotAuthenticatedAlertDialog();
    });
  
  return;
}
                 Navigator.push(context,
                  PageTransition(type: PageTransitionType.fade ,child:  
    AddPostScreen()));

}, 
child: Center(child: Icon(Icons.add , color: Colors.white,),


),
),
bottomNavigationBar: BottomNavigationBar(
  onTap: (index){

    log(index.toString());
    if (index==2) {
      return;
    }

    if (index==4) {
  if (homeProvider.isLoggedIn()) {
    _selectedPage =index;
  setState(() {
      
    });
  }else{
    showDialog(context: context, builder: (_){


      return NotAuthenticatedAlertDialog();
    });
  }
  return;
}
if (index==1) {
  if (homeProvider.isLoggedIn()) {
    _selectedPage =index;
  setState(() {
      
    });
  }else{
    showDialog(context: context, builder: (_){


      return NotAuthenticatedAlertDialog();
    });
  }
  return;
}
             _selectedPage = index;
  setState(() {
      
    });
  
  },

  selectedItemColor: Theme.of(context).primaryColor,
  unselectedItemColor: Colors.black,
  showUnselectedLabels: true,

  currentIndex: _selectedPage,
  selectedLabelStyle: TextStyle(
    color:Theme.of(context).primaryColor ,
    fontSize: 12
  ),
  unselectedLabelStyle: TextStyle(
    color: Colors.grey ,
    fontSize: 12
  ),
  // unselectedFontSize: 12,
  items: [


  BottomNavigationBarItem(icon: Icon(Icons.home,),

  
    label: getTranslated('home', context)), 
  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: getTranslated('favourite', context)), 
    BottomNavigationBarItem(icon: SizedBox(), label: ''), 

  BottomNavigationBarItem(icon: Icon(Icons.search),label:  getTranslated('advacnce_search', context)), 
  BottomNavigationBarItem(icon: Icon(Icons.mail), label: getTranslated('messages', context)), 



]),














    );
  }
}
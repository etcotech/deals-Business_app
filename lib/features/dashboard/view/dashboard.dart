import 'dart:developer';

import 'package:deals_and_business/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';

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
      Container(), 
            Container(),  //white

      Container(),
      Container()
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,



body: _screens[_selectedPage],

floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

floatingActionButton: FloatingActionButton(
  
  shape:CircleBorder(),
  backgroundColor: Theme.of(context).primaryColor,
  onPressed: (){

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

  
    label: 'Home'), 
  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'), 
    BottomNavigationBarItem(icon: SizedBox(), label: ''), 

  BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'), 
  BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messages'), 



]),














    );
  }
}
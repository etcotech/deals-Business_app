import 'package:deals_and_business/features/home/widgets/home_search_container.dart';
import 'package:deals_and_business/shared/widgets/app_drawer.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/menu_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final bool? asGuest;
  const HomeScreen({super.key, this.asGuest=false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      appBar: AppBar(
  leading:
  !widget.asGuest!?
  MenuButton(
    onTap: (){
      Scaffold.of(context).openDrawer();
    },
  ):
  MyBackButton(
    onTap:(){
      Navigator.pop(context);
    },
  ),
  
  //  SizedBox(),
  // title: Text( AppLocalizations.of(context)!.language),
centerTitle: true,
elevation: 0.0,
        backgroundColor: Colors.white,



),
drawer: AppDrawer(),
drawerEnableOpenDragGesture: false, 

body: CustomScrollView(
  slivers: [
    SliverToBoxAdapter(
      child: Column(
        children: [

HomeSearchContainer()


        ],
      ),
    )
  ],
),
    );
  }
}
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/home/widgets/home_categories.dart';
import 'package:deals_and_business/features/home/widgets/home_listings.dart';
import 'package:deals_and_business/features/home/widgets/home_search_container.dart';
import 'package:deals_and_business/shared/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final bool? asGuest;
  const HomeScreen({super.key, this.asGuest=false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
backgroundColor:

 Colors.white,
      appBar: 
      
      MyAppBar(context,
      title: getTranslated('home', context),
        onTapDrawer: (){
          scaffoldKey.currentState!.openDrawer();
        },
        onCountryTap: (){

        }, 
        isGuest: widget.asGuest!
      ),

drawer: AppDrawer(),
drawerEnableOpenDragGesture: false, 

body: CustomScrollView(
  slivers: [
    SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

HomeSearchContainer()
,
SizedBox(height: 24,),
HomeCategories(),
SizedBox(height: 24,),

HomeListings()
        ],
      ),
    )
  ],
),
    );
  }
}
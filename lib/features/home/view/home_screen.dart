import 'dart:developer';

import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:deals_and_business/features/home/widgets/home_categories.dart';
import 'package:deals_and_business/features/home/widgets/home_listings.dart';
import 'package:deals_and_business/features/home/widgets/home_search_container.dart';
import 'package:deals_and_business/shared/widgets/app_drawer.dart';
import 'package:deals_and_business/shared/widgets/countries_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/error_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final bool? asGuest;
  const HomeScreen({super.key, this.asGuest=false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
void _gridScrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      //Fetch
log("BOTTOM OF GRID");
  context.read<HomeProvider>().getMorePosts(context);
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
_scrollController.addListener(_gridScrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_){
      
initHome();

    });
  }

initHome(){
     context.read<HomeProvider>().isVersionOld();
  context.read<HomeProvider>().getCategories(context);
context.read<HomeProvider>().getPosts(context);
}
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context , provider,child) {

        if (provider.isCategoryLoading  ||  provider.isLoading) {
          return Scaffold(
            body: SizedBox.expand(
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        }else if(provider.errorData!=null){
return Scaffold(
    body: SizedBox.expand(
      child: Center(

child: ErrorContainer(
  onRetry: (){
initHome();
  },
  onLogin: (){


  },
  errorData: 
  provider.errorData!),

      ),
    ),
  );

}
        return Scaffold(
          key: scaffoldKey,
        backgroundColor:
        
         Colors.white,
          appBar: 
          
          MyAppBar(context,
          currentCountry: 'assets/images/ksa.png',
          title: getTranslated('home', context),
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
                        provider.saveCountryData(country);
                      },
                    );
                  },
                );
            }, 
            isGuest: widget.asGuest!
          ),
        
        drawer: AppDrawer(),
        drawerEnableOpenDragGesture: false, 
        
        body: RefreshIndicator(
          onRefresh: ()async{
            provider.refreshPosts(context);
                        provider.refreshCategories(context);

          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
          HomeSearchContainer()
          ,
          Visibility(
            visible: provider.isOldVersion,
            child: GestureDetector(
              onTap: (){
                 context.read<HomeProvider>().launchStore();
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 35, 
                decoration: BoxDecoration(
                  color: Colors.orange
                ),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              
                       Text(        getTranslated("new_update_available", context)!,
                       
                       
                       style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400
                    ),
                       )
                , Icon(Icons.warning_rounded , color: Colors.white,),
                    ],
                  )
                  
                  
                  
                ),
              ),
            ),
          ),
          SizedBox(height: 24,),
          HomeCategories(),
          SizedBox(height: 24,),
          
          HomeListings(), 


          Visibility(
            visible: provider.isPaginateLoading,
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ))
              ],
            ),
          )
            ],
          ),
        ),
        );
      }
    );
  }
}
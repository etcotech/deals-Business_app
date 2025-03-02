import 'dart:developer';

import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/search/search_post_model.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/home/widgets/listing_icon.dart';
import 'package:deals_and_business/features/posts/views/post_details_screen.dart';
import 'package:deals_and_business/features/search/providers/search_provider.dart';
import 'package:deals_and_business/features/search/widgets/search_input_field.dart';
import 'package:deals_and_business/features/search/widgets/selected_category_widget.dart';
import 'package:deals_and_business/shared/widgets/app_drawer.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/categories_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/city_filter_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/countries_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/price_filter_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/sort_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AdvanceSearchScreen extends StatefulWidget {
  final bool? asGuest;
  final bool? fromDashboard;
  const AdvanceSearchScreen({super.key, this.asGuest=false, 
  
  this.fromDashboard= true
  });

  @override
  State<AdvanceSearchScreen> createState() => _AdvanceSearchScreenState();
}

class _AdvanceSearchScreenState extends State<AdvanceSearchScreen> {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    var searchController = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
// context.read<SearchProvider>().search();


    });
  }



  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      key: scaffoldKey,
      appBar: 
      
      !widget.fromDashboard!?
      AppBar(
        leading: MyBackButton(
          onTap: (){
            Navigator.pop(context);
          },
        ),
        elevation:  0 , 
        backgroundColor: Colors.white,
        title: Text(getTranslated('advacnce_search', context)! ,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),

      ):
       MyAppBar(context, 
      
      
      currentCountry: 'assets/images/ksa.png',
      title: getTranslated('advacnce_search', context),
        onTapDrawer: (){
          scaffoldKey.currentState!.openDrawer();
        },
        onCountryTap: (){
showModalBottomSheet(
              context: context,
              isDismissible: true, // Prevent dismissal
              enableDrag: false, // Prevent dragging to dismiss
              backgroundColor: Colors.transparent, // Make background transparent
              builder: (context) {
                return CountriesBottomsheet();
              },
            );
        }, 
        isGuest: widget.asGuest!
      ),
resizeToAvoidBottomInset: false,
drawer: AppDrawer(),
drawerEnableOpenDragGesture: false, 
      backgroundColor: Colors.white,

body: Consumer<SearchProvider>(
  builder: (context,provider,child) {
    return SizedBox.expand(child: 
    Column(children: [
    SizedBox(height: 20,),
    
        Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 8,
          
            children: [
             SearchInputField(
                            
                            onChange: provider.onSearchChanged,
                            controller: searchController, hintText: getTranslated('search_now',
                                 context)!, iconData: Icons.search,)
                      , 
          
                               
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(getTranslated(Strings.filterBy, context)!, 
                          
                          style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 16
                          ),
                          
                          )
                                , 
                                
                                GestureDetector(
                                  onTap: (){
                                     showModalBottomSheet(
                      context: context,
                      isDismissible: false, // Prevent dismissal
                      enableDrag: false, // Prevent dragging to dismiss
                      backgroundColor: Colors.transparent, // Make background transparent
                      builder: (context) {
                        return CategoriesBottomsheet(
onDeleteCategory: (){
                              context.read<SearchProvider>().remoteCategory();
  context.read<SearchProvider>().applyCategorySearch();
},
                          onSelectCategory: (cat){
                            context.read<SearchProvider>().setCategorory(cat);
                              context.read<SearchProvider>().applyCategorySearch();

                          },
                        );
                      },
                                      );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                color: Colors.white ,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0), 
                                    color: Colors.white54 , 
                                    spreadRadius: 5, 
                                    blurRadius: 3
                                  )
                                ]
                                    ),
                                    padding: EdgeInsets.all(8),
                                  
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.arrow_drop_down),
                                  
                            Text(getTranslated(Strings.allCategories, context)!, 
                            
                            style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 16
                            ),
                            
                            ),
                                    Icon(Icons.category),
                                  
                                  
                                  
                                  
                                  ],
                                    ),
                                  ),
                                ), 
                                
                                
                                
                                
                                 PopupMenuButton(
                                      onSelected: (choice){
                                if (choice.contains('price')) {
                                  showModalBottomSheet(
                      context: context,
                      isDismissible: true, // Prevent dismissal
                      enableDrag: false, // Prevent dragging to dismiss
                      backgroundColor: Colors.transparent, // Make background transparent
                      builder: (context) {
return PriceFilterBottomsheet(setPrices: (start,end){
  log(end.toString());
provider.setStartPrice(start);
provider.setEndPrice(end);

} , 
apply: (){
provider.applyCategorySearch();
},

);
                        }
                                  );
                                }else{

                                   showModalBottomSheet(
                    context: context,
                    isDismissible: true, // Prevent dismissal
                    enableDrag: false, // Prevent dragging to dismiss
                    backgroundColor: Colors.transparent, // Make background transparent
                    builder: (context) {
                      return CityFilterBottomsheet(
                        onSelectCity: (city){
                        // provider.setCity(
                        //   city
                        // );
                        },
                      );
                    },
                                    );
                                }
                                      },
                                      padding: EdgeInsets.zero,
                                      // initialValue: choices[_selection],
                                      itemBuilder: (BuildContext context) {
                      return [Strings.filtrtByPrice ,Strings.filterByCity].map((String choice) {
                        return  PopupMenuItem<String>(
                        value: choice,
                        child: Text(getTranslated(choice, context)!
                        ,
                         style: TextStyle(
                        color: Colors.grey
                      ),
                        ),
                      );}
                      ).toList();
                                      },
                                      menuPadding: EdgeInsets.zero,
                                    position: PopupMenuPosition.under,
                                
                                      child:
                                      
                                       Container(
                                  
                                    width: 35, height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8), 
                                      color: Colors.white, 
                                      boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.grey[300]!,
                        blurRadius: 4,
                        spreadRadius: 1
                      )
                                      ]
                                    ),
                                  
                                    child: Center(
                                      child: Icon(Icons.tune),
                                    ),
                                  ),
                                
                                    ), 
                                
                                
                                 PopupMenuButton(
                                  position: PopupMenuPosition.under,
                                      onSelected: (choice){
                                       showModalBottomSheet(
                      context: context,
                      isDismissible: true, // Prevent dismissal
                      enableDrag: false, // Prevent dragging to dismiss
                      backgroundColor: Colors.transparent, // Make background transparent
                      builder: (context) {
                        return SortBottomsheet(
selectedOrder: (order){
provider.setSortOrder(order);
},
selectedSort: (sort){
provider.setSortBy(sort);
},
apply:(){
provider.applyCategorySearch();
}

                        );
                      });
                                      },
                                      padding: EdgeInsets.zero,
                                      // initialValue: choices[_selection],
                                      itemBuilder: (BuildContext context) {
                      return [Strings.sortBy].map((String choice) {
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
                                menuPadding: EdgeInsets.zero,
                                      child: Container(
                                  
                                    width: 35, height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8), 
                                      color: Colors.white, 
                                      boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.grey[300]!,
                        blurRadius: 4,
                        spreadRadius: 1
                      )
                                      ]
                                    ),
                                  
                                    child: Center(
                                      child: Icon(Icons.list),
                                    ),
                                  ),
                                    ), 
                                
                                
                                
                                
                                
                                
                                
                                
                        ],
                      ), 


                      Visibility(
                        
                        visible: provider.category!=null,
                        child: 
                      SelectedCategoryWidget(title: provider.category,
                      onTap: (){
                        provider.remoteCategory();
                        provider.applyCategorySearch();
                      },
                      )
                      )
          ],),
        ),
       
      
                        Builder(
                          builder: (context) {
                        if (provider.error!=null) {
                           return SizedBox(
                            height: 500,
                      child: Center(child: Text(provider.error.toString()),),
                           );
                        }
                        if (provider.isLoading) {
                          return SizedBox(
                            height: 500,
                            child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),));
                        
                        }
                        
                        if (provider.posts.isEmpty) {
                          return SizedBox(
                            height: 500,
                            child: Center(child: 
                            
                            Text(getTranslated(Strings.noPosts, context)!)
                            ));
                        
                        }
                            
                            return 
                            
                            Expanded(
                              child: SingleChildScrollView(
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var post  =  provider.posts[index];
                                                    
                                  return SearchPost(postSearchModel: post,);
                                },
                                itemCount: provider.posts.length,
                                
                                ),
                              ),
                            );
                         
                          }
                        )
                        
    
    ],)
    
    );
  }
),

      );
    
    
     Scaffold(
      key: scaffoldKey,

      appBar:  MyAppBar(context, currentCountry: 'assets/images/ksa.png',
      title: getTranslated('advance_search', context),
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
      backgroundColor: Colors.white,

      body: Consumer<SearchProvider>(
        builder: (context, provider,child) {
          return CustomScrollView(
            slivers: [
        //  Sliver

        SliverAppBar(
          pinned: true,
          floating: true,
          leading: SizedBox(),
          toolbarHeight: 150,
          backgroundColor: Colors.white,
          actions: []
          ,
        
        flexibleSpace: 
        
        Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 8,
          
            children: [
             SearchInputField(
                            
                            onChange: provider.onSearchChanged,
                            controller: searchController, hintText: getTranslated('search_now',
                                 context)!, iconData: Icons.search,)
                      , 
          
                               
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(getTranslated(Strings.filterBy, context)!, 
                          
                          style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 16
                          ),
                          
                          )
                                , 
                                
                                GestureDetector(
                                  onTap: (){
                                     showModalBottomSheet(
                      context: context,
                      isDismissible: false, // Prevent dismissal
                      enableDrag: false, // Prevent dragging to dismiss
                      backgroundColor: Colors.transparent, // Make background transparent
                      builder: (context) {
                        return CategoriesBottomsheet(
onDeleteCategory: (){
                              context.read<SearchProvider>().remoteCategory();
  context.read<SearchProvider>().applyCategorySearch();
},
                          onSelectCategory: (cat){
                            context.read<SearchProvider>().setCategorory(cat);
                              context.read<SearchProvider>().applyCategorySearch();

                          },
                        );
                      },
                                      );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                color: Colors.white ,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0), 
                                    color: Colors.white54 , 
                                    spreadRadius: 5, 
                                    blurRadius: 3
                                  )
                                ]
                                    ),
                                    padding: EdgeInsets.all(8),
                                  
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.arrow_drop_down),
                                  
                            Text(getTranslated(Strings.allCategories, context)!, 
                            
                            style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 16
                            ),
                            
                            ),
                                    Icon(Icons.category),
                                  
                                  
                                  
                                  
                                  ],
                                    ),
                                  ),
                                ), 
                                
                                
                                
                                
                                 PopupMenuButton(
                                      onSelected: (choice){
                                if (choice.contains('price')) {
                                  showModalBottomSheet(
                      context: context,
                      isDismissible: true, // Prevent dismissal
                      enableDrag: false, // Prevent dragging to dismiss
                      backgroundColor: Colors.transparent, // Make background transparent
                      builder: (context) {
return PriceFilterBottomsheet(setPrices: (start,end){
provider.setStartPrice(start);
provider.setEndPrice(end);
} , 
apply: (){
provider.applyCategorySearch();
},

);
                        }
                                  );
                                }else{

                                   showModalBottomSheet(
                    context: context,
                    isDismissible: true, // Prevent dismissal
                    enableDrag: false, // Prevent dragging to dismiss
                    backgroundColor: Colors.transparent, // Make background transparent
                    builder: (context) {
                      return CityFilterBottomsheet(
                        onSelectCity: (city){
                        // provider.setCity(
                        //   city
                        // );
                        },
                      );
                    },
                                    );
                                }
                                      },
                                      padding: EdgeInsets.zero,
                                      // initialValue: choices[_selection],
                                      itemBuilder: (BuildContext context) {
                      return [Strings.filtrtByPrice ,Strings.filterByCity].map((String choice) {
                        return  PopupMenuItem<String>(
                        value: choice,
                        child: Text(getTranslated(choice, context)!
                        ,
                         style: TextStyle(
                        color: Colors.grey
                      ),
                        ),
                      );}
                      ).toList();
                                      },
                                      menuPadding: EdgeInsets.zero,
                                    position: PopupMenuPosition.under,
                                
                                      child:
                                      
                                       Container(
                                  
                                    width: 35, height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8), 
                                      color: Colors.white, 
                                      boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.grey[300]!,
                        blurRadius: 4,
                        spreadRadius: 1
                      )
                                      ]
                                    ),
                                  
                                    child: Center(
                                      child: Icon(Icons.tune),
                                    ),
                                  ),
                                
                                    ), 
                                
                                
                                 PopupMenuButton(
                                  position: PopupMenuPosition.under,
                                      onSelected: (choice){
                                       showModalBottomSheet(
                      context: context,
                      isDismissible: true, // Prevent dismissal
                      enableDrag: false, // Prevent dragging to dismiss
                      backgroundColor: Colors.transparent, // Make background transparent
                      builder: (context) {
                        return SortBottomsheet(
selectedOrder: (order){
provider.setSortOrder(order);
},
selectedSort: (sort){
provider.setSortBy(sort);
},
apply:(){
provider.applyCategorySearch();
}

                        );
                      });
                                      },
                                      padding: EdgeInsets.zero,
                                      // initialValue: choices[_selection],
                                      itemBuilder: (BuildContext context) {
                      return [Strings.sortBy].map((String choice) {
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
                                menuPadding: EdgeInsets.zero,
                                      child: Container(
                                  
                                    width: 35, height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8), 
                                      color: Colors.white, 
                                      boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.grey[300]!,
                        blurRadius: 4,
                        spreadRadius: 1
                      )
                                      ]
                                    ),
                                  
                                    child: Center(
                                      child: Icon(Icons.list),
                                    ),
                                  ),
                                    ), 
                                
                                
                                
                                
                                
                                
                                
                                
                        ],
                      ), 


                      Visibility(
                        
                        visible: provider.category!=null,
                        child: 
                      SelectedCategoryWidget(title: provider.category,
                      onTap: (){
                        provider.remoteCategory();
                        provider.applyCategorySearch();
                      },
                      )
                      )
          ],),
        ),
       
        ),
              SliverToBoxAdapter(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).width,
                      child: Column(
                        spacing: 16,
                        children: [
                               
                        
                        
                        Builder(
                          builder: (context) {
                        if (provider.error!=null) {
                           return SizedBox(
                            height: 500,
                      child: Center(child: Text(provider.error.toString()),),
                           );
                        }
                        if (provider.isLoading) {
                          return SizedBox(
                            height: 500,
                            child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),));
                        
                        }
                        
                        if (provider.posts.isEmpty) {
                          return SizedBox(
                            height: 500,
                            child: Center(child: 
                            
                            Text(getTranslated(Strings.noPosts, context)!)
                            ));
                        
                        }
                            
                            return 
                            
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var post  =  provider.posts[index];
                                                
                              return SearchPost(postSearchModel: post,);
                            },
                            itemCount: provider.posts.length,
                            
                            );
                         
                          }
                        )
                        
                        
                        ],
                      ),
                    ),
                  ),
                ),
              )
          , 

         
            ],
          );
        }
      ),
    );
  }
}

class SearchPost extends StatelessWidget {
  final PostSearchModel? postSearchModel;
  const SearchPost({super.key, this.postSearchModel});

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,
        
        child: PostDetailsScreen(postId: postSearchModel!.id.toString(),)
        ));
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height/7,
        
        
        child: Card(
          color: Colors.white,
              semanticContainer: true,
          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
        
          ),
        child: Container(width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height/7,
        padding: EdgeInsets.all(5),          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(postSearchModel!.pictureUrlBig!, 
                        width:    MediaQuery.sizeOf(context).width*.30,
                height: MediaQuery.sizeOf(context).height/7,
                fit: BoxFit.cover,
                ),
                
                ),
          SizedBox(width: 5,),
          
              Padding(
                padding: const EdgeInsets.symmetric(

                  vertical: 5
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                            width: MediaQuery.sizeOf(context).width*.35,
                            child: Text(postSearchModel!.category!.name!, 
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
                            child: Text(postSearchModel!.title!, 
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
                Text(postSearchModel!.createdAtFormatted!.toString(), 
                style: TextStyle(
                  color: Colors.grey
                ),
                )
                            ],
                          )
                          
                      
                      
                          
                    //  ,SizedBox(height: 6,)
                      
                  ],
                ),
              )
            ],
          ), 
          
         
          
            ],
          ),
        )
        )
      ),
    );
      
  }
}
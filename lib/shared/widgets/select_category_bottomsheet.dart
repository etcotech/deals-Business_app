import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/category/category_subcategoory_model.dart';
import 'package:deals_and_business/features/category/providers/category_provider.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../features/home/providers/home_provider.dart';

class SelectCategoryBottomsheet extends StatefulWidget {
  final Function(Children)? onSelectCategory;
    final Function()? onDeleteCategory;

  const SelectCategoryBottomsheet({super.key, this.onSelectCategory, this.onDeleteCategory});

  @override
  State<SelectCategoryBottomsheet> createState() => _SelectCategoryBottomsheetState();
}

class _SelectCategoryBottomsheetState extends State<SelectCategoryBottomsheet> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
context.read<CategoryProvider>().getCategoriesDetailed(context);

    });
  }
   int? selectedCat;

      CategorySubcategoryModel? categoryModel;

Children? children;
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context,  provider, child) {

        return Container(
          height: MediaQuery.sizeOf(context).height/2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
          ),
          ),
          child: 
          
          Builder(
            builder: (context) {


        if (provider.isCategoryLoading) {
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),);
          
        }
              return Column(
                children: [
                  // Drag handle
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  Builder(
                    builder: (context) {
                      return
                      provider.isCategoryLoading?
                      Expanded(child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),))
              
                      : Expanded(
                        child: Column(
                          children: [
                            Text(
                      getTranslated(Strings.categories, context)!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),              SizedBox(height: 8),
                      
                            Expanded(
                              child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                                child:
                                categoryModel!=null?
                                Row(
                                  spacing: 16,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16,
  children: provider.categoris.asMap().map((i, element) => MapEntry(i,
  GestureDetector(
    onTap: (){
      categoryModel= provider.categoris[i];
      selectedCat =categoryModel!.id;
      setState(() {
        
      });
    },
    child: Icon(
                                              getIcon(
                                                provider.categoris[i].iconClass, 
                                              
                                              
                                              ), 
                                              size: 32,
                                              color: selectedCat!=null? selectedCat==provider.categoris[i].id?Theme.of(context).primaryColor 
                                               : Colors.grey:   Colors.grey,
                                              
                                            ),
  )

)
).values.toList()
)

                                
                    , 
                    Expanded(child: ListView.builder(
                      itemCount: categoryModel!.children!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var child = categoryModel!.children![index];
                        return    InkWell(
                          onTap: (){
                            children = child;
                            setState(() {
                              
                            });
                          },
                          child: SizedBox(
                            height: 40,
                            child: Row(
                            spacing: 16,
                              children: [
                            Icon(Icons.folder ,  
                            size: 32,
                            
                            color:
                            
                            children != null? 
children!.id== child.id?
Theme.of(context).primaryColor:
Colors.grey

                            :

                             Colors.grey,), 
                            
                            Text(child.name!, 
                            style: TextStyle(
                                   color:
                            
                            children != null? 
children!.id== child.id?
Theme.of(context).primaryColor:
Colors.grey

                            :

                             Colors.grey
                            ),
                            
                            )
                              ],
                            ),
                          ),
                        ) ;
                      },
                    ),)            
                                
                                
                                
                                  ],
                                ):
                                
                                
                                 ListView.builder(
                                  itemCount: provider.categoris.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var cateogory = provider.categoris[index];
                                    return ListTile(
                                      onTap: (){
                                            selectedCat = cateogory.id;
                                            categoryModel =cateogory;
                                            setState(() {
                                              
                                            });
                                                             if (widget.onSelectCategory!=null && categoryModel!=null) {
                                    // widget.onSelectCategory!(categoryModel!);
                                  }                                      },
                                      title: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            getIcon(cateogory.iconClass, 
                                            
                                            
                                            ), 
                                            color: selectedCat!=null? selectedCat==cateogory.id?Theme.of(context).primaryColor 
                                             : Colors.grey:   Colors.grey,
                                            
                                          ), 
                                
                                          SizedBox(width: 3,),
                                          Text(cateogory.name!,
                                          style: TextStyle(
                                            color: selectedCat!=null?
                                             selectedCat==cateogory.id?Theme.of(context).primaryColor 
                                             : Colors.grey:   Colors.grey,
                                          ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                             
                             
                              ),
                            ),
                          
                          
                          Visibility(
                            visible: children!=null,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: MainButton(
                                color: Theme.of(context).primaryColor,
                                title: getTranslated(Strings.apply, context),
                              onTap: (){
                                widget.onSelectCategory!(children!);
                                Navigator.pop(context);
                              },
                              ),
                            )),
                          SizedBox(height: 24,)
                          ],
              
                        ),
                      );
                    }
                  ),
                  
                ],
              );
            }
          ),
        );
      }
    );
  }

  getIcon(String? icon){
    switch (icon) {
      case  "fas fa-store":
         return  FontAwesomeIcons.store;
        case  "fas fa-cog":
         return  FontAwesomeIcons.gear;
         case  "fas fa-users":
         return  FontAwesomeIcons.users;


      default:
               return  Icons.category;

    }
  }
}
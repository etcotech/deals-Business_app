import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/category/views/category_details_screen.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 18), 
    
    child: 
    
    Consumer<HomeProvider>(
     builder: (context, provider, child)=> Builder(
        builder: (context) {
if (provider.isCategoryLoading) {
   return  
          
          
          
           Skeletonizer(
            enabled: true,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                       Text(getTranslated('browse_by_category', context)!,
                       
                       style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold
                       ),
                       ), 
                       SizedBox(height: 16,), 
                       Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                       HomeCategory(
              title: 'المشاريع التجارية',
              image: "https://dealsandbusiness.com/storage/app/categories/custom/thumb-70x70-803d1851ab38ff79dc55aff7e40e3466.jpeg",
                       ), 
                       
              HomeCategory(
              title: 'المشاريع التجارية',
              image: "https://dealsandbusiness.com/storage/app/categories/custom/thumb-70x70-803d1851ab38ff79dc55aff7e40e3466.jpeg",
                       ),   HomeCategory(
              title: 'المشاريع التجارية',
              image: "https://dealsandbusiness.com/storage/app/categories/custom/thumb-70x70-803d1851ab38ff79dc55aff7e40e3466.jpeg",
                       ), 
              ],
                       )
                       
                       
                       ],),
           );
        
}
else{
 return  
          
          
          
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(getTranslated('browse_by_category', context)!,
          
          style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold
          ),
          ), 
          SizedBox(height: 16,), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            
             provider.categoris.map((category)=>
             
             HomeCategory(
              onTap: (){


                Navigator.of(context).push(
                  PageTransition(type: PageTransitionType.fade , 
                  child: CategoryDetailsScreen(
                    categoryModel: category,
                  )
                  )
                );
              },
            title: category.name,
            image: category.iconClass,
          ), 
              ).toList()
          )
          
          
          ],);
        
}
         
        
        }
      ),
    ),
    );
  }
}

class HomeCategory extends StatelessWidget {
  final String? title;
  final String? image;
  final Function? onTap;
  const HomeCategory({super.key, this.title, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        onTap!();
      },
      child:
      
       Container(
      
          width: MediaQuery.sizeOf(context).width*.28,
           height: MediaQuery.sizeOf(context).width*.28,
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
              child: Column(
      
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
      
                 Icon(getIcon(image , ),              
                       color: Theme.of(context).primaryColor, 
      ), 
      SizedBox(height: 8,),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width*.25,
                    child: Text(title! , 
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                     fontWeight: FontWeight.bold, 
                      fontSize: 12
                    ),
                    ),
                  )
                ],
              ),
            ),
      ),
    
    
    
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
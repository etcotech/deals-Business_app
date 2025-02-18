import 'package:deals_and_business/core/constants/translate.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 18), 
    
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
}

class HomeCategory extends StatelessWidget {
  final String? title;
  final String? image;
  const HomeCategory({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return  Container(

        width: MediaQuery.sizeOf(context).width*.28, height: MediaQuery.sizeOf(context).width*.28,
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

                Image.network(image!,              
                    //  color: Theme.of(context).primaryColor, 
), 
                Text(title! , 
                
                style: TextStyle(
                 fontWeight: FontWeight.bold, 
                  fontSize: 12
                ),
                )
              ],
            ),
          ),
    );
  }
}
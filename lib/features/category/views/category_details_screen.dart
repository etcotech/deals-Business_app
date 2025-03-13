import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/category/category_subcategoory_model.dart';
import 'package:deals_and_business/features/category/widgets/sub_category_widget.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final CategorySubcategoryModel? categoryModel;
  const CategoryDetailsScreen({super.key, this.categoryModel});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {



  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){

if (false) {
  return Scaffold(
    body: SizedBox.expand(
      child: Center(child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),),
    ),
  );
}else {

return Scaffold(

appBar: AppBar(
  backgroundColor: Colors.transparent, 
leading: MyBackButton(
  onTap: (){
    Navigator.of(context).pop();
  },
),
  title: Text(
    widget.categoryModel!.name.toString(), 
    style: TextStyle(
      fontWeight: FontWeight.bold
    ),
  ),

),

body: SizedBox.expand(
  child: SingleChildScrollView(
   
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    SizedBox(height: 16,),
    

    Padding( padding: EdgeInsets.symmetric(
      horizontal: 15
    ),
    
    child: Text(
      "${getTranslated(Strings.subCategoriesIn, context)!} ${widget.categoryModel!.name}", 
style: TextStyle(
  fontWeight: FontWeight.bold, 
  fontSize: 14
),


    ),
    ), 
    
    
    SizedBox(height: 16,),
    
    
    SizedBox(
    width: MediaQuery.sizeOf(context).width,
     height:  MediaQuery.sizeOf(context).width*.29,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true ,
      itemCount:widget.categoryModel!.children!.length,
      itemBuilder: (context ,index){
        var SubCategory= widget.categoryModel!.children![index];
        return Center(
          child: SubCategoryWidget(
            title: SubCategory.name
          ),
        );
      
    
    
    }),
    )
    
    
      ],
    ),
  ),
),
);
}

    });
}

}
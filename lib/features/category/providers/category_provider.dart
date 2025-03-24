import 'dart:developer';

import 'package:deals_and_business/core/error/error_handler.dart';
import 'package:deals_and_business/data/models/category/category_subcategoory_model.dart';
import 'package:deals_and_business/data/models/error_data.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/domain/repositories/category_repository.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepository? categoryRepository;

  CategoryProvider({required this.categoryRepository});
  bool isLoading = false;
ErrorData? errorData;
bool isCategoryLoading = false;
List<CategorySubcategoryModel> categoris =[];
List<PostModel> categoryPosts =[];
List<PostModel> subCategoryposts =[];

  Future<void> getCategorDetails()async{
    isLoading = true;
    errorData = null;
    notifyListeners();

    try {
      
    } catch (e) {
      isLoading = false;
      errorData = ErrorData(message: getErrorMessage(e.toString()),
      
      icon: getErrorIcon(e.toString())
       );

       notifyListeners();
    }

     isLoading = false;
    notifyListeners();
  }


Future<void> getCategoriesDetailed(BuildContext context)async{
  isCategoryLoading = true;

notifyListeners();
try {
  
var result = await categoryRepository!.getCategoriesDetailed();
result.fold((failre){
showErrorMessage(context, failre.toString());
}, (success){
  categoris =[];

categoris.addAll(success.categoryPaginateModel.categories!);
});

} catch (e) {
  
showErrorMessage(context, e.toString());

  isCategoryLoading = false;

notifyListeners();
}

isCategoryLoading = false;

notifyListeners();
}

  Future<void> getCategoryPosts(String categoryId)async{
    isLoading = true;
    errorData = null;
    notifyListeners();
  

  


            
    try {
      var result = await categoryRepository!.getCategoryPosts(categoryId);
result.fold(
  
  (failre)
{
  errorData = ErrorData(message: failre.toString(), icon: getErrorIcon(failre.message.toString()));
}
, (success){           

  categoryPosts =[];        
categoryPosts.addAll(success.posts);
notifyListeners();
}
  );
     isLoading = false;
    notifyListeners();  
    } catch (e) {

      log(e.toString());
      isLoading = false;
      errorData = ErrorData(message: getErrorMessage(e.toString()),
      
      icon: getErrorIcon(e.toString())
       );

       notifyListeners();
    }

     isLoading = false;
    notifyListeners();
  }

  Future<void> getSubCategoryPosts(String categoryId)async{
    isLoading = true;
    errorData = null;
    notifyListeners();
  

  


            
    try {
      var result = await categoryRepository!.getCategoryPosts(categoryId);
result.fold(
  
  (failre)
{
  errorData = ErrorData(message: failre.toString(), icon: getErrorIcon(failre.message.toString()));
}
, (success){           

  subCategoryposts =[];        
subCategoryposts.addAll(success.posts);
notifyListeners();
}
  );
     isLoading = false;
    notifyListeners();  
    } catch (e) {

      log(e.toString());
      isLoading = false;
      errorData = ErrorData(message: getErrorMessage(e.toString()),
      
      icon: getErrorIcon(e.toString())
       );

       notifyListeners();
    }

     isLoading = false;
    notifyListeners();
  }

}
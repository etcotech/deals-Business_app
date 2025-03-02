import 'package:deals_and_business/core/error/error_handler.dart';
import 'package:deals_and_business/data/models/category/category_subcategoory_model.dart';
import 'package:deals_and_business/data/models/error_data.dart';
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

}
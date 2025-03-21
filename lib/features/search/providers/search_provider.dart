import 'dart:async';

import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/category/category_subcategoory_model.dart';
import 'package:deals_and_business/data/models/search/search_post_model.dart';
import 'package:deals_and_business/domain/repositories/search_repository.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final SearchRepository? searchRepository;

  SearchProvider({required this.searchRepository});
String keyword ='';
double price_from=0.0;
double price_to =0.0;
String? category_id;
String? error;
String sort_by ='price';
String sort_order ='asc';
 Timer? _debounceTimer;
  final String _searchQuery = '';
  List<PostSearchModel> posts =[];
  bool isLoading =false;
String? category;
clear(){
  posts=[];

  notifyListeners();
}

setCategorory(CategorySubcategoryModel? categoryModel){
  category = categoryModel!.name!.toString();
  category_id = categoryModel.id.toString();
  notifyListeners();
}
setStartPrice(double price){
  price_from = price;
  notifyListeners();
}
setEndPrice(double price){
  price_to = price;
  notifyListeners();
}


remoteCategory(){
  category =null;
  category_id=null;
  notifyListeners();
}

setSortBy(String? sortby){
  if (sortby!=null) {
      sort_by =sortby;
      if (sortby.toLowerCase().contains('price')) {
        sort_by = 'price';
      }else{
                sort_by = 'title';

      }
  notifyListeners();

  }

}
removeSortBy(){
   sort_by ='price';
  notifyListeners();
}




setSortOrder(String? order){
if (order!=null) {
if (order.contains("za") || order.contains("desc")) {
  sort_order ='desc';
}else{
  sort_order ='asc';
}

notifyListeners();
}  
}
removeSortOrder(){
   sort_by ='desc';
  notifyListeners();
}


applyCategorySearch(){
  search();

}



 void onSearchChanged(String? value) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel(); // Cancel the previous timer
    }

    _debounceTimer = Timer(Duration(milliseconds: 500), () {

      keyword = value.toString();

    notifyListeners();
    search();
      // Perform search operation here
      // setState(() {
      //   _searchQuery = value;
      // });
      // print('Searching for: $_searchQuery');
    });
  }



search(
//{String keyword = '' , 
//       double price_from  =0.0,
//       double price_to = 0.0,
//       String category_id ='',
//       String sort_by = 'price',
//       String sort_order = 'desc'  //asc

//       }
)async{
isLoading= true;
error =null;
notifyListeners();

try {
  var result = await  searchRepository!.search(
'',
keyword: keyword ,
price_from: price_from, 
price_to:price_to, 
category_id: category_id ,
sort_by: sort_by,
sort_order: sort_order
  );

  result.fold((failure){
error = failure.toString();
notifyListeners();
  }, (success){
    posts =[];
posts.addAll(success.searchPaginatedModel.posts!);
notifyListeners();

  });
} catch (e) {

  error = e.toString();
notifyListeners();
  
}
isLoading= false;
notifyListeners();


      }


}
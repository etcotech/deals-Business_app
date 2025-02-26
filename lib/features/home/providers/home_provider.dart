import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/country/city_model.dart';
import 'package:deals_and_business/data/models/country/country_model.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/domain/repositories/category_repository.dart';
import 'package:deals_and_business/domain/repositories/country_repositories.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

   final PostRepository? postRepository;
   final CategoryRepository? categoryRepository;
   final CountryRepository? countryRepository;

  HomeProvider({required this.postRepository ,this.categoryRepository , this.countryRepository});
  
bool isLoading = false;
bool isCategoryLoading = false;

bool isCountryLoading = false;

bool isCityLoading = false;

List<CategoryModel> categoris =[];
List<PostModel> posts =[];
List<CountryModel> countries =[];
List<CityModel> cities =[];

Future<void> getCategories(BuildContext context)async{
  isCategoryLoading = true;

notifyListeners();
try {
  
var result = await categoryRepository!.getCategories();
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
Future<void> getPosts(BuildContext context)async{
  isLoading = true;
notifyListeners();
try {
  var result = await postRepository!.getPosts();
result.fold((failre){
showErrorMessage(context, failre.toString());
}, (success){
posts =[];
posts.addAll(success.postPaginateModel.posts!);
});
} catch (e) {
  showErrorMessage(context, e.toString());

  isLoading = false;

notifyListeners();
}

isLoading = false;
notifyListeners();
}



Future<void> getCountries(BuildContext context)async{
  isCountryLoading = true;
notifyListeners();
try {
  var result = await countryRepository!.getCountries();
result.fold((failre){
showErrorMessage(context, failre.toString());
}, (success){
countries =[];
countries.addAll(success.countryListPaginateModel.countries!);
});
} catch (e) {
  showErrorMessage(context, e.toString());

  isCountryLoading = false;

notifyListeners();
}

isCountryLoading = false;
notifyListeners();
}


  Future<void> getCities(BuildContext context)async{
  isCityLoading = true;
notifyListeners();
try {
  var result = await countryRepository!.getCities();
result.fold((failre){
showErrorMessage(context, failre.toString());
}, (success){
cities =[];
cities.addAll(success.cityPaginateModel.cities!);
});
} catch (e) {
  showErrorMessage(context, e.toString());

  isCityLoading = false;

notifyListeners();
}

isCityLoading = false;
notifyListeners();
}


}
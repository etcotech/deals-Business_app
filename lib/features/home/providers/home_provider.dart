import 'dart:developer';

import 'package:deals_and_business/core/error/error_handler.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/country/city_model.dart';
import 'package:deals_and_business/data/models/country/country_model.dart';
import 'package:deals_and_business/data/models/error_data.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/domain/repositories/category_repository.dart';
import 'package:deals_and_business/domain/repositories/country_repositories.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/features/splash/view/splash_screen.dart';
import 'package:deals_and_business/main.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeProvider extends ChangeNotifier {
final UserRepository? userRepository;
   final PostRepository? postRepository;
   final CategoryRepository? categoryRepository;
   final CountryRepository? countryRepository;

  HomeProvider({required this.postRepository ,this.categoryRepository , 
  this.countryRepository, this.userRepository});
    ErrorData? errorData;
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
errorData = null;
notifyListeners();
try {
  
var result = await categoryRepository!.getCategories();
result.fold((failure){
  errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
if (failure is CredentialFailure) {
  //logout
logout();
  
}
}, (success){
  categoris =[];

categoris.addAll(success.categoryPaginateModel.categories!);
});

} catch (e) {

      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  notifyListeners();

  isCategoryLoading = false;

notifyListeners();
}

isCategoryLoading = false;

notifyListeners();
}

Future<void> getPosts(BuildContext context)async{
  isLoading = true;
errorData = null;
notifyListeners();
try {
  var result = await postRepository!.getPosts();
result.fold((failure){
    log("FAILURE$failure");

  errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
if (failure is CredentialFailure) {
  //logout
logout();
  
}
}, (success){
posts =[];
posts.addAll(success.postPaginateModel.posts!);
});
} catch (e) {

      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  notifyListeners();

  isLoading = false;

notifyListeners();
}

isLoading = false;
notifyListeners();
}


Future<void>refreshPosts(BuildContext context)async{
//   isLoading = true;
errorData = null;
notifyListeners();
try {
  var result = await postRepository!.getPosts();
result.fold((failure){
    log("FAILURE$failure");

  errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
if (failure is CredentialFailure) {
  //logout
logout();
  
}
}, (success){
posts =[];
posts.addAll(success.postPaginateModel.posts!);
});
} catch (e) {

      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  notifyListeners();

  isLoading = false;

notifyListeners();
}

isLoading = false;
notifyListeners();
}


Future<void> getCountries(BuildContext context)async{
  isCountryLoading = true;
errorData = null;
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
errorData = null;
notifyListeners();
try {
  var result = await countryRepository!.getCities();
result.fold((failre){
showErrorMessage(context, failre.toString());
}, (success){
cities =[];
cities.addAll(success.cityPaginateModel.cities!);
notifyListeners();
});
} catch (e) {
  showErrorMessage(context, e.toString());

  isCityLoading = false;

notifyListeners();
}

isCityLoading = false;
notifyListeners();
}
bool isLoggedIn()=> userRepository!.isLoggedIn();
logout(){
  userRepository!.logout();
  Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(

    PageTransition(type: 
    PageTransitionType.leftToRight ,

    child: SplashScreen()
    ), 
    (v)=> false
  );
 }
}
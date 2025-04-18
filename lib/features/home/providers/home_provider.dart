import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/error/error_handler.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/core/services/remote_config_services.dart';
import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/category/category_subcategoory_model.dart';
import 'package:deals_and_business/data/models/country/city_model.dart';
import 'package:deals_and_business/data/models/country/country_model.dart';
import 'package:deals_and_business/data/models/error_data.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/data/models/post/post_paginate_model.dart';
import 'package:deals_and_business/domain/repositories/category_repository.dart';
import 'package:deals_and_business/domain/repositories/country_repositories.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/features/splash/view/splash_screen.dart';
import 'package:deals_and_business/main.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

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
int _currentPage= 1;
bool loadMore= false;
bool isCityLoading = false;
bool isOldVersion= false;
bool isPaginateLoading= false;

List<CategorySubcategoryModel> categoris =[];
List<PostModel> posts =[];
List<CountryModel> countries =[];
List<CityModel> cities =[];
 PaginateLinks? paginateLinks;
Future<void> getCategories(BuildContext context)async{
  isCategoryLoading = true;
errorData = null;
notifyListeners();
try {
  
var result = await categoryRepository!.getCategoriesDetailed();
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
   log("FAILURE$e");

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

Future<void> getPosts(BuildContext context, {bool isRefresh=false})async{
  isLoading = true;
errorData = null;
if(isRefresh){
  _currentPage=1;
  posts = [];
  paginateLinks = null;
}
notifyListeners();
try {

  var result = await postRepository!.getPosts(currentPage: _currentPage);
  
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
paginateLinks = success.postPaginateModel.paginateLinks;
// _currentPage = success.postPaginateModel.meta.
  _currentPage++;

if (_currentPage<=success.postPaginateModel.meta!.lastPage!) {
  loadMore = true;
}else{
    loadMore=false;

}
// if()
posts.addAll(success.postPaginateModel.posts!);
});




} catch (e) {
   log("FAILURE PORSTS $e");

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


Future<void> getMorePosts(BuildContext context)async{
errorData = null;
notifyListeners();
try {

log("CURRENT: $_currentPage  ");
if (loadMore) {
    isPaginateLoading = true;
notifyListeners();
  //  var result = await postRepository!.getMorePosts(
  //   "${paginateLinks!.last}op=search,latest&embed=user,category,parent,postType,city,currency,savedByLoggedUser,pictures,payment,package&sort=created_at&perPage=10"
  // );
  var result = await postRepository!.getPosts(currentPage: _currentPage);
result.fold((failure){
    log("FAILURE GET MORE $failure");

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
// posts =[];

paginateLinks = success.postPaginateModel.paginateLinks;
  _currentPage++;

if (_currentPage<=success.postPaginateModel.meta!.lastPage!) {
  loadMore = true;
}else{
  loadMore=false;
}
posts.addAll(success.postPaginateModel.posts!);
notifyListeners();
});

}
 



} catch (e) {
   log("FAILURE MORE PORSTS $e");

      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  notifyListeners();

  isPaginateLoading = false;

notifyListeners();
}

isPaginateLoading = false;
notifyListeners();
}

Future<void>refreshCategories(BuildContext context)async{
  // isCategoryLoading = true;
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
   log("CATEGORIES $e");

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

Future<void>refreshPosts(BuildContext context)async{
//   isLoading = true;
errorData = null;
notifyListeners();
try {
  var result = await postRepository!.getPosts();
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
  log("SUCCESS");
posts =[];
paginateLinks = success.postPaginateModel.paginateLinks;
posts.addAll(success.postPaginateModel.posts!);
notifyListeners();
});
} catch (e) {
    log("REFRESH $e");
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
saveCountryData(CountryModel country
){
  userRepository!.setCountryCode(country.code!);
    userRepository!.setCountryFlag(country.flag16Url!);
  userRepository!.setCountryName(country.name!);
  userRepository!.setCountryPhoneCode(country.phone!);

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
Future<bool> isVersionRequired()async{
  final remoteConfig = RemoteConfigServices();
var isRequired =remoteConfig.getBoolValue(Strings.appleCurrentBuild);
return isRequired;
}
Future<String> getVersion()async{
   final remoteConfig = RemoteConfigServices();
var appleRevarmoteBuild =remoteConfig.getValue(Strings.appleCurrentBuild);
var googleRemoteBuild=remoteConfig.getValue(Strings.googleCurrentBuild);
var googleRemoteVersion=remoteConfig.getValue(Strings.googleCurrentVersion);
var appleRemoteVersion= remoteConfig.getValue(Strings.appleCurrentVersion);
String version= Platform.isIOS?
"$appleRemoteVersion.$appleRevarmoteBuild"
: 
"$googleRemoteVersion.$googleRemoteBuild"
;
return version;

}

 Future<void> isVersionOld()async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
final remoteConfig = RemoteConfigServices();

var appleRevarmoteBuild =remoteConfig.getValue(Strings.appleCurrentBuild);
var googleRemoteBuild=remoteConfig.getValue(Strings.googleCurrentBuild);
var googleRemoteVersion=remoteConfig.getValue(Strings.googleCurrentVersion);
var appleRemoteVersion= remoteConfig.getValue(Strings.appleCurrentVersion);
var localBuild = packageInfo.buildNumber;
var localVersion = packageInfo.version;
bool isOldVersion= Platform.isIOS?
"$appleRemoteVersion+$appleRevarmoteBuild" !=  "$localVersion+$localBuild"
: 
"$googleRemoteVersion+$googleRemoteBuild" !=  "$localVersion+$localBuild"
;


 this.isOldVersion = isOldVersion;
notifyListeners();

 }


 void launchStore() async {

  final url = Platform.isAndroid ?Strings. playStoreUrl :Strings. appStoreUrl;
  
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
}
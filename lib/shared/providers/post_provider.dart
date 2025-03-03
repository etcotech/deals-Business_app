import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/error_handler.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/category/category_subcategoory_model.dart';
import 'package:deals_and_business/data/models/country/city_model.dart';
import 'package:deals_and_business/data/models/country/country_model.dart';
import 'package:deals_and_business/data/models/error_data.dart';
import 'package:deals_and_business/data/models/post/favorite_post_paginate_model.dart';
import 'package:deals_and_business/data/models/post/message_model.dart';
import 'package:deals_and_business/data/models/post/new_post_model.dart';
import 'package:deals_and_business/data/models/post/post_details_model.dart';
import 'package:deals_and_business/data/models/post/post_details_response_model.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/data/models/post/post_paginate_model.dart';
import 'package:deals_and_business/data/models/post/thread_message_model.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/features/splash/view/splash_screen.dart';
import 'package:deals_and_business/main.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class PostProvider extends ChangeNotifier {
  final PostRepository? postRepository;
  final UserRepository? userRepository;
  PostProvider({required this.postRepository , required this.userRepository , });
  
bool isLoading = false;
bool isFavourite= false;
CityModel? selectedCity;
CategoryModel? selectedCat;
Children? selectedCat2;
CountryModel? selectedCountry;
List<XFile> files =[];
PostDetailsModel? postDetailsModel;
List<FavoritePostModel> favouritePosts=[];
List<MessageModel> messages=[];
List<ThreadMessageModel> threadMessages=[];

String? error;
void addFile(XFile file){
  files.add(file);
  notifyListeners();

}
void remoteFile(file){
  files.removeWhere((xfile)=> xfile.path==file);
  notifyListeners();
}

void setCountry(CountryModel country){
  selectedCountry =country;
  selectedCity=null;
  notifyListeners();

}
 ErrorData? errorData;
void setCategory(Children category){
  selectedCat2 =category;
  notifyListeners();
  
}

void setCity(CityModel city){
  selectedCity =city;
  notifyListeners();
  
}

Future<void> addPost(BuildContext context , String title,String desc , String price)async{
  isLoading =true;
  errorData = null;
  notifyListeners();
try {
  var newPost = NewPostModel(
category_id: selectedCat2!.id!.toString(),
country_code: selectedCountry!.code!.toString(),
city_id: selectedCity!.id!.toString(),
description: desc,
price: int.parse(price),
title: title,
contact_name: userRepository!.getUserName(),
accept_terms: true,
pictures: files.map((file)=> File(file.path)).toList()



  );
  var result = await  postRepository!.addPost(newPost);

  result.fold((failure){
showErrorMessage(context, failure.message.toString());

  }, (success){
    selectedCat=null;
selectedCity=null;
selectedCountry=null;
files=[];
notifyListeners();
showSuccessMessage(context, 'Post Sent!');
Navigator.pop(context);

  });
} catch (e) {
  

    isLoading =false;
  notifyListeners();

  showErrorMessage(context, e.toString());
}

  isLoading =false;
  notifyListeners();
}


Future getFavouritePosts()async{
    isLoading= true;
    error= null;
    errorData= null;
    notifyListeners();
  try {
    var result = await postRepository!.getFavouritePosts();
    result.fold((failure){

 error = failure.message.toString();
 errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
     notifyListeners();

    }, (success){
      favouritePosts =[];
      favouritePosts.addAll(success.favoritePostPaginateModel.posts!);
// postDetailsModel = success.postDetailsModel;
// isFavourite= postDetailsModel!.featured==1;
notifyListeners();
    });
  } catch (e) {
    errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  isLoading= false;
  notifyListeners();
     error= e.toString();
     notifyListeners();
    
  }
    isLoading= false;
    notifyListeners();
}

Future refreshFavouritePosts()async{
    // isLoading= true;
    error= null;
    errorData= null;
    notifyListeners();
  try {
    var result = await postRepository!.getFavouritePosts();
    result.fold((failure){

 error = failure.message.toString();
 errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
     notifyListeners();

    }, (success){
      favouritePosts =[];
      favouritePosts.addAll(success.favoritePostPaginateModel.posts!);
// postDetailsModel = success.postDetailsModel;
// isFavourite= postDetailsModel!.featured==1;
notifyListeners();
    });
  } catch (e) {
    errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  isLoading= false;
  notifyListeners();
     error= e.toString();
     notifyListeners();
    
  }
    isLoading= false;
    notifyListeners();
}
Future<Either<Failure, PostDetailsResponseModel>> getFavouritePost(postId)async{
  return  await postRepository!.getPost('',postId);
}




Future getPost(String postId)async{
    isLoading= true;
    error= null;
    notifyListeners();
  try {
    var result = await postRepository!.getPost('',postId);
    result.fold((failure){

 error = failure.message.toString();
   errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
     notifyListeners();

    }, (success){
      // favouritePosts =[];
      // favouritePosts.addAll(success.postPaginateModel.posts!);
postDetailsModel = success.postDetailsModel;
isFavourite= success.postDetailsModel.savedByLoggedUser!.isNotEmpty;

notifyListeners();
    });
  } catch (e) {
     error= e.toString();
     notifyListeners();
      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  isLoading= false;
  notifyListeners();
  }
    isLoading= false;
    notifyListeners();
}

 final Map<int, bool> _isItemLoading = {};

  PostDetailsModel? getItem(int id) => _items[id];
  bool isItemLoading(int id) => _isItemLoading[id] ?? false;
  final Map<int, PostDetailsModel> _items = {};

Future getPostDetails(String postId)async{
   if (_items.containsKey(int.parse(postId))) return; // Avoid fetching the same item twice
    _isItemLoading[int.parse(postId)]= true;
    error= null;
    notifyListeners();
  try {
    var result = await postRepository!.getPost('',postId);
    result.fold((failure){

 error = failure.message.toString();
   errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
     notifyListeners();

    }, (success){
      // favouritePosts =[];
      // favouritePosts.addAll(success.postPaginateModel.posts!);
postDetailsModel = success.postDetailsModel;
isFavourite= success.postDetailsModel.savedByLoggedUser!.isNotEmpty;
 _items[int.parse(postId)] = success.postDetailsModel;
notifyListeners();
    });
  } catch (e) {
     error= e.toString();
     notifyListeners();
      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
   _isItemLoading[int.parse(postId)]= false;
  notifyListeners();
  }
   _isItemLoading[int.parse(postId)]= false;
    notifyListeners();
}

Future refreshFavouite(String postId)async{
   
  try {
    var result = await postRepository!.getPost('', postId);
    result.fold((failure){

 error = failure.message.toString();
   errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
     notifyListeners();

    }, (success){
postDetailsModel = success.postDetailsModel;
isFavourite= success.postDetailsModel.savedByLoggedUser!.isNotEmpty;

notifyListeners();
    });
  } catch (e) {
      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  isLoading= false;
  notifyListeners();
    
  }
   
}




Future<void> addPostToFavourite(BuildContext context , String postId)async{
  isFavourite= !isFavourite;
  notifyListeners();
 try {
    var result = await postRepository!.addPostFavourite('token', postId);
    result.fold((failure){

 error = failure.message.toString();
     notifyListeners();
     log(failure.toString());
          showErrorMessage(context, failure.toString());
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
      // selectedCat=null;
      // selectedCat2= null;
      // selectedCity= null;
      // selectedCity= null;
      showSuccessMessage(context, json.decode(success)['message']);

refreshFavouite(postId);
refreshFavouritePosts();
notifyListeners();
    });
  } catch (e) {     log(e.toString());

          showErrorMessage(context, e.toString());

    errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
      isLoading= false;
  notifyListeners();
  }
}

Future<void> getPosts(BuildContext context)async{
  isLoading = true;
notifyListeners();
try {
  var result = await postRepository!.getPosts();
result.fold((failre){
showErrorMessage(context, failre.toString());
}, (success){
// favouritePosts =[];
// favouritePosts.addAll(success.postPaginateModel.posts!);
});
} catch (e) {
  showErrorMessage(context, e.toString());

  isLoading = false;

notifyListeners();
}

isLoading = false;
notifyListeners();
}
 
 
Future<void> getMessages(BuildContext context)async{
  isLoading = true;
  errorData= null;
notifyListeners();
try {
  var result = await postRepository!.getMessages();
result.fold((failure){
  error = failure.message.toString();
 errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
     notifyListeners();
showErrorMessage(context, failure.toString());
}, (success){
messages =[];
messages.addAll(success.messageListPaginateModel.messages!);
});
} catch (e) {

   errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  isLoading= false;
  showErrorMessage(context, e.toString());

  isLoading = false;

notifyListeners();
}

isLoading = false;
notifyListeners();
}
 
 
 
Future<void> getThreadMessages(BuildContext context , String threadId)async{
  isLoading = true;
  errorData= null;
notifyListeners();
try {
  var result = await postRepository!.getThreadMessages(
    threadId
  );
result.fold((failure){
  error = failure.message.toString();
 errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
     notifyListeners();
showErrorMessage(context, failure.toString());
}, (success){
threadMessages =[];
threadMessages.addAll(success.threadMessagePaginate.messages!);
});
} catch (e) {

   errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  isLoading= false;
  showErrorMessage(context, e.toString());

  isLoading = false;

notifyListeners();
}

isLoading = false;
notifyListeners();
}
 
 
 
Future<void> refreshThreadMessages(BuildContext context , String threadId)async{
//   isLoading = true;
//   errorData= null;
// notifyListeners();
try {
  var result = await postRepository!.getThreadMessages(
    threadId
  );
result.fold((failure){
//   error = failure.message.toString();
//  errorData = ErrorData(
//     message: getErrorMessage(failure.message.toString()), 
//     icon: getErrorIcon(failure.message.toString())
//   );
  isLoading= false;
  notifyListeners();
     notifyListeners();
showErrorMessage(context, failure.toString());
}, (success){
threadMessages =[];
threadMessages.addAll(success.threadMessagePaginate.messages!);
notifyListeners();
});
} catch (e) {

  //  errorData = ErrorData(
  //   message: getErrorMessage(e.toString()), 
  //   icon: getErrorIcon(e.toString())
  // );
  isLoading= false;
  showErrorMessage(context, e.toString());

  isLoading = false;

notifyListeners();
}

isLoading = false;
notifyListeners();
}
 
 String getUserEmail()=> userRepository!.getUserEmail();

Future<void> reportPoast(BuildContext context , 
String? postId,
int reportType,
String msg,String email )async{
  isLoading =true;
  errorData = null;
  notifyListeners();
try {

  var result = await  postRepository!.reportPost(postId.toString(),
  reportType.toString(), 
  email,
  msg
   );

  result.fold((failure){
showErrorMessage(context, failure.message.toString());

  }, (success){
    selectedCat=null;
selectedCity=null;
selectedCountry=null;
files=[];
notifyListeners();
showSuccessMessage(context, 'Report Sent!');
Navigator.pop(context);

  });
} catch (e) {
  

    isLoading =false;
  notifyListeners();

  showErrorMessage(context, e.toString());
}

  isLoading =false;
  notifyListeners();
}

 
Future<void> sendMessage(BuildContext context , 
String? postId,
String name,
String msg,String email )async{
  isLoading =true;
  errorData = null;
  notifyListeners();
try {

  var result = await  postRepository!.sendMessage(postId.toString(),
  name.toString(), 
  email,
  msg
   );

  result.fold((failure){
showErrorMessage(context, failure.message.toString());

  }, (success){
//     selectedCat=null;
// selectedCity=null;
// selectedCountry=null;
// files=[];
notifyListeners();
showSuccessMessage(context, 'Message Sent!');
Navigator.pop(context);

  });
} catch (e) {
  

    isLoading =false;
  notifyListeners();

  showErrorMessage(context, e.toString());
}

  isLoading =false;
  notifyListeners();
}

 
 
 
Future<void> sendChatMessage(BuildContext context , 
String? postId,
String name,
String msg,String email )async{
  // isLoading =true;
  // errorData = null;
  // notifyListeners();
try {

  var result = await  postRepository!.sendMessage(postId.toString(),
  name.toString(), 
  email,
  msg
   );

  result.fold((failure){
showErrorMessage(context, failure.message.toString());

  }, (success){
//     selectedCat=null;
// selectedCity=null;
// selectedCountry=null;
// files=[];
// notifyListeners();

showSuccessMessage(context, 'Message Sent!');
// Navigator.pop(context);
refreshThreadMessages(context, postId!);
  });
} catch (e) {
  

    isLoading =false;
  notifyListeners();

  showErrorMessage(context, e.toString());
}

  // isLoading =false;
  // notifyListeners();
}

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
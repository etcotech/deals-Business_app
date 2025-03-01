import 'dart:convert';
import 'dart:io';

import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/data/models/country/city_model.dart';
import 'package:deals_and_business/data/models/country/country_model.dart';
import 'package:deals_and_business/data/models/post/new_post_model.dart';
import 'package:deals_and_business/data/models/post/post_details_model.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostProvider extends ChangeNotifier {
  final PostRepository? postRepository;
  final UserRepository? userRepository;
  PostProvider({required this.postRepository , required this.userRepository , });
  
bool isLoading = false;
bool isFavourite= false;
CityModel? selectedCity;
CategoryModel? selectedCat;
CountryModel? selectedCountry;
List<XFile> files =[];
PostDetailsModel? postDetailsModel;
List<PostModel> favouritePosts=[];

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

void setCategory(CategoryModel category){
  selectedCat =category;
  notifyListeners();
  
}

void setCity(CityModel city){
  selectedCity =city;
  notifyListeners();
  
}

Future<void> addPost(BuildContext context , String title,String desc , String price)async{
  isLoading =true;
  notifyListeners();
try {
  var newPost = NewPostModel(
category_id: selectedCat!.id!.toString(),
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
    notifyListeners();
  try {
    var result = await postRepository!.getFavouritePosts();
    result.fold((failure){

 error = failure.message.toString();
     notifyListeners();

    }, (success){
      favouritePosts =[];
      favouritePosts.addAll(success.postPaginateModel.posts!);
// postDetailsModel = success.postDetailsModel;
// isFavourite= postDetailsModel!.featured==1;
notifyListeners();
    });
  } catch (e) {
     error= e.toString();
     notifyListeners();
    
  }
    isLoading= false;
    notifyListeners();
}

Future getPost(String postId)async{
    isLoading= true;
    error= null;
    notifyListeners();
  try {
    var result = await postRepository!.getPost('',postId);
    result.fold((failure){

 error = failure.message.toString();
     notifyListeners();

    }, (success){
      favouritePosts =[];
      // favouritePosts.addAll(success.postPaginateModel.posts!);
postDetailsModel = success.postDetailsModel;
isFavourite= postDetailsModel!.featured==1;
notifyListeners();
    });
  } catch (e) {
     error= e.toString();
     notifyListeners();
    
  }
    isLoading= false;
    notifyListeners();
}


Future refreshFavouite(String postId)async{
   
  try {
    var result = await postRepository!.getPost('', postId);
    result.fold((failure){

 error = failure.message.toString();
     notifyListeners();

    }, (success){
postDetailsModel = success.postDetailsModel;
isFavourite= success.postDetailsModel.featured==1;
notifyListeners();
    });
  } catch (e) {
    
    
  }
   
}




Future<void> addPostToFavourite(BuildContext context , String postId)async{
  isFavourite= true;
  notifyListeners();
 try {
    var result = await postRepository!.addPostFavourite('token', postId);
    result.fold((failure){

 error = failure.message.toString();
     notifyListeners();
          showErrorMessage(context, failure.toString());

    }, (success){
      showSuccessMessage(context, json.decode(success)['message']);

refreshFavouite(postId);
notifyListeners();
    });
  } catch (e) {
          showErrorMessage(context, e.toString());

    
    
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
favouritePosts =[];
favouritePosts.addAll(success.postPaginateModel.posts!);
});
} catch (e) {
  showErrorMessage(context, e.toString());

  isLoading = false;

notifyListeners();
}

isLoading = false;
notifyListeners();
}

}
import 'dart:developer';

import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/data/dataSources/remote/app_http_client.dart';
import 'package:deals_and_business/data/models/category/category_list_response_model.dart';
import 'package:deals_and_business/data/models/category/category_sub_category_list_response_model.dart';
import 'package:deals_and_business/data/models/country/country_list_reponse_model.dart';
import 'package:deals_and_business/data/models/post/category_post_response.dart';
import 'package:deals_and_business/data/models/post/post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/subcategory_post_response.dart';
import 'package:http/http.dart' as http;
abstract class CategoryRemoteDataSource {
    Future<CategorySubCategoryListResponseModel> getCategories({String? lang ='ar'});
    Future<CategorySubCategoryListResponseModel> getCategoriesDetailed({String? lang ='ar'});
    Future<CategoryPostResponse> getCategoryPosts(
      String? categoryId,
      
      {String? lang ='ar'});
Future<SubcategoryPostResponse> getSubCategoryPosts(
      String? categoryId,
      
      {String? lang ='ar'});
}
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;
  final ApiClient? apiClient;
  CategoryRemoteDataSourceImpl({required this.client, 
  required this.apiClient
  
  });
  
   @override
  Future<CategorySubCategoryListResponseModel> getCategories ({String? lang ='ar'})async{
  
  var response2=  await apiClient!.get('$categoriesApi?embed=children,parent');
   return categorySubCategoryListResponseModelFromJson(response2);
  
  
  //  final response =
  //       await client.get(Uri.parse('$baseUrl$categoriesApi?embed=children,parent'),
  //           headers: {
  //             'Content-Type': 'application/json',
  //             'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=' ,
  //             Strings.contentLang: lang!
  //           },
          
            
  //           );
  //   if (response.statusCode == 200) {
  //     log(response.body);
  //     return categoryListResponseModelFromJson(response.body);
  //   } else if (response.statusCode == 400 || response.statusCode == 401) {
  //     throw TokenExpiredException(
  //     );
  //   } else {
  //     throw ServerException();
  //   }
  }
  
  @override
  Future<CategorySubCategoryListResponseModel> getCategoriesDetailed({String? lang = 'ar'})async {
   
   var respone2 = await apiClient!.get('$categoriesApi?embed=children,parent');
         return categorySubCategoryListResponseModelFromJson(respone2);

  //  final response =
  //       await client.get(Uri.parse('$baseUrl$categoriesApi?embed=children,parent'),
  //           headers: {
  //             'Content-Type': 'application/json',
  //             'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=' ,
  //             Strings.contentLang: lang!
  //           },
          
            
  //           );
  //   if (response.statusCode == 200) {
  //     log(response.body);
  //     return categorySubCategoryListResponseModelFromJson(response.body);
  //   } else if (response.statusCode == 400 || response.statusCode == 401) {
  //     throw TokenExpiredException(
  //     );
  //   } else {
  //     throw ServerException();
  //   }
  }
  
  @override
  Future<CategoryPostResponse> getCategoryPosts(String? categoryId, {String? lang = 'ar'})async {
   log( "CATEGORY ID $categoryId");  
   var respone2 = await apiClient!.get('$categoriesApi$categoryId?embed=posts,chidlren,childrenPosts');
        
        log("CATEGIRY DATA${respone2['result']}");
        
         return categoryPostListResponseModelFromJson(respone2);
  }
  
  @override
  Future<SubcategoryPostResponse> getSubCategoryPosts(String? categoryId, {String? lang = 'ar'})async {
       log( "CATEGORY ID $categoryId");  
   var respone2 = await apiClient!.get('$categoriesApi$categoryId?embed=posts,');
        
        log("CATEGIRY DATA${respone2['result']}");
        
         return subCategoryPostListResponseModelFromJson(respone2);
  }

}
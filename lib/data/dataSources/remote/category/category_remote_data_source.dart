import 'dart:developer';

import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/data/models/category/category_list_response_model.dart';
import 'package:deals_and_business/data/models/category/category_sub_category_list_response_model.dart';
import 'package:deals_and_business/data/models/country/country_list_reponse_model.dart';
import 'package:http/http.dart' as http;
abstract class CategoryRemoteDataSource {
    Future<CategoryListResponseModel> getCategories({String? lang ='ar'});
    Future<CategorySubCategoryListResponseModel> getCategoriesDetailed({String? lang ='ar'});

}
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;
  CategoryRemoteDataSourceImpl({required this.client});
  
   @override
  Future<CategoryListResponseModel> getCategories ({String? lang ='ar'})async{
   final response =
        await client.get(Uri.parse('$baseUrl$categoriesApi'),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=' ,
              Strings.contentLang: lang!
            },
          
            
            );
    if (response.statusCode == 200) {
      log(response.body);
      return categoryListResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw TokenExpiredException(
      );
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<CategorySubCategoryListResponseModel> getCategoriesDetailed({String? lang = 'ar'})async {
   final response =
        await client.get(Uri.parse('$baseUrl$categoriesApi?embed=children,parent'),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=' ,
              Strings.contentLang: lang!
            },
          
            
            );
    if (response.statusCode == 200) {
      log(response.body);
      return categorySubCategoryListResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw TokenExpiredException(
      );
    } else {
      throw ServerException();
    }
  }

}
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/search/search_response_model.dart';
import 'package:http/http.dart' as http;
abstract class SearchRemoteDataSource {
  
      Future<SearchResponseModel> search(String token,{String keyword = '' , String? lang ='ar' , 
      double price_from  =0.0,
      double price_to = 0.0,
      String? category_id,
      String sort_by = 'price',
      String sort_order = 'desc'  //asc

      });

       Future<SearchResponseModel> searchNextPage(
        String token,
        String url);

}


class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final http.Client client;
  SearchRemoteDataSourceImpl({required this.client});
  
  @override
  Future<SearchResponseModel> search(String token,{String keyword = '',
   String? lang = 'ar', 
   double price_from = 0.0, double price_to = 0.0,
 String? category_id,    
    String sort_by = 'price', String sort_order = 'desc'}) async{
   
     try {

      var body =  {
'keyword': keyword,
'price_from': price_from.toString(), 
'price_to':price_to.toString() ,
'sort_by':sort_by ,
'sort_order':sort_order
            
          };
          if (category_id!=null) {
            body['category_id']=category_id;

          }
         final response =
        await client.post(Uri.parse('$baseUrl$searchAPi'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token,
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
            },
          body: json.encode(
            body
          )
            
            );
   
   if (response.statusCode == 200) {
      log(response.body);
      return searchResponseModelFromJson(response.body);
    } else if ( response.statusCode == 401) {
      throw CredentialFailure(
        message: 'expire'
      );
    } else {
      log(response.body.toString());
      throw ServerException();
    }
     } 
     on SocketException{
      throw NetworkFailure(message: 'network');

     }
     on TimeoutException{
      throw TimeoutFailure(message: 'timeout');
     }
     
     catch (e) {
     rethrow;  
     }
  }
  
  @override
  Future<SearchResponseModel> searchNextPage(        String token,
String url)async {
     try {
         final response =
        await client.get(Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token,
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
            },
       
            
            );
   
   if (response.statusCode == 200) {
      log(response.body);
      return searchResponseModelFromJson(response.body);
    } else if ( response.statusCode == 401) {
      throw CredentialFailure(
        message: 'expire'
      );
    } else {
      throw ServerException();
    }
     } 
     on SocketException{
      throw NetworkFailure(message: 'network');

     }
     on TimeoutException{
      throw TimeoutFailure(message: 'timeout');
     }
     
     catch (e) {
     rethrow;  
     }
  }


}
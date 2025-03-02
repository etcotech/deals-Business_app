import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/country/city_list_response_model.dart';
import 'package:deals_and_business/data/models/country/country_list_reponse_model.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
abstract class CountryRemoteDataSource {
    Future<CountryListResponseModel> getCountries({String? lang ='ar'});
    Future<CityListResponseModel> getCities({String? code='sa' , String? lang ='ar'});

}
class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final http.Client client;
  CountryRemoteDataSourceImpl({required this.client});
  
   @override
  Future<CountryListResponseModel> getCountries ({String? lang ='ar'})async{
   
      final cacheManager = DefaultCacheManager();
var url = '$baseUrl$countriesApi';
    //   final file = await cacheManager.getSingleFile(url);
    // if (await file.exists()) {
    //   log("FILE EXISTS");
    //   final cachedData = await file.readAsString();
      
    //   return countryListResponseModelFromJson(cachedData);
    // }

    try {
       
   
   final response =
        await client.get(Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              Strings.contentLang: lang!
            },
          
            
            );
    if (response.statusCode == 200) {
      log(response.body);
                  await cacheManager.putFile(url, response.bodyBytes);

      return countryListResponseModelFromJson(response.body);
    } else if (response.statusCode == 400){
throw RouteException('not_found');
    }
     else if( response.statusCode == 401) {
      throw TokenExpiredException(
        
      );
    } else {
      throw ServerFailure(message: 'server');
    }
    } 
    on SocketException{
      throw NetworkFailure(message: 'network');
    }
    on TimeoutException{
            throw TimeoutFailure(message:  'timeout');

    }
    catch (e) {
            throw Exception('unknown');

    }
  }
  
  @override
  Future<CityListResponseModel> getCities({String? code = 'sa', String? lang ='ar'})async {
      final cacheManager = DefaultCacheManager();
var url = '$baseUrl/api/countries/$code/cities';
//       final file = await cacheManager.getSingleFile(url);
//     if (await file.exists()) {
//       log("FILE EXISTS");
//       final cachedData = await file.readAsString();
      
//       return cityListResponseModelFromJson(cachedData);
//     }

  
      final response =
        await client.get(Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              Strings.contentLang: lang!
            },
          
            
            );
    if (response.statusCode == 200) {
      log(response.bodyBytes.toString());
            await cacheManager.putFile(url, response.bodyBytes);
      log(response.body);
      return cityListResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw TokenExpiredException(
      );
    } else {
      throw ServerException();
    }
  }

}
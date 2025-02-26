import 'dart:developer';

import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/data/models/country/city_list_response_model.dart';
import 'package:deals_and_business/data/models/country/country_list_reponse_model.dart';
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
   final response =
        await client.get(Uri.parse('$baseUrl${countriesApi}'),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              Strings.contentLang: lang!
            },
          
            
            );
    if (response.statusCode == 200) {
      log(response.body);
      return countryListResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw TokenExpiredException(
      );
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<CityListResponseModel> getCities({String? code = 'sa', String? lang ='ar'})async {
      final response =
        await client.get(Uri.parse('$baseUrl/api/countries/${code}/cities'),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              Strings.contentLang: lang!
            },
          
            
            );
    if (response.statusCode == 200) {
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
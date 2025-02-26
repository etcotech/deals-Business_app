import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/search/search_response_model.dart';

abstract class SearchRepository {
  
   Future<Either<Failure, SearchResponseModel>> search(String token,{String keyword = '' , String? lang ='ar' , 
      double price_from  =0.0,
      double price_to = 0.0,
      String? category_id,
      String sort_by = 'price',
      String sort_order = 'desc'  //asc

      });
  Future<Either<Failure, SearchResponseModel>> searchNexPage(
 String token,
        String url  );
}
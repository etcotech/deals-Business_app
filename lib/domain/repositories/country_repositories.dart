
import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/country/city_list_response_model.dart';
import 'package:deals_and_business/data/models/country/country_list_reponse_model.dart';

abstract class CountryRepository {
  Future<Either<Failure, CountryListResponseModel>> getCountries();
  Future<Either<Failure, CityListResponseModel>> getCities();

  // Future<Either<Failure, User>> signUp(SignUpParams params);
  // Future<Either<Failure, NoParams>> signOut();
  // Future<Either<Failure, User>> getCachedUser();


}
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/DTO_models/CategoryResponseDTO.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/home_remote_data_source.dart';
import 'package:e_commerce_app/data/endpoints.dart';
import 'package:e_commerce_app/domain/entity_models/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../DTO_models/BrandResponseDTO.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, CategoryResponseDto>> getAllCategories() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(Endpoints.getAllCategories);
        var jsonResponse = response.data;
        var categoryResponse = CategoryResponseDto.fromJson(jsonResponse);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerFailure(errorMessage: categoryResponse.message!));
        }
      } else {
        return Left(NetworkFailure(errorMessage: "No InternetConnection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BrandResponseEntity>> getAllBrands() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(Endpoints.getAllBrands);
        var jsonResponse = response.data;
        var brandResponse = BrandResponseDto.fromJson(jsonResponse);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerFailure(errorMessage: brandResponse.message!));
        }
      } else {
        return Left(NetworkFailure(errorMessage: "No InternetConnection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}

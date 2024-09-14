import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/DTO_models/GetCartResponseDTO.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/cart_remote_data_source.dart';
import 'package:e_commerce_app/data/endpoints.dart';
import 'package:e_commerce_app/domain/entity_models/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/features/shared_preferences_utils.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, GetCartResponseEntity>> getCart() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferencesUtils.getData("token");
        var response = await apiManager
            .getData(Endpoints.getCart, headers: {"token": token});
        var jsonResponse = response.data;
        var getCartResponse = GetCartResponseDto.fromJson(jsonResponse);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerFailure(errorMessage: getCartResponse.message!));
        }
      } else {
        return Left(NetworkFailure(errorMessage: "No internet connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
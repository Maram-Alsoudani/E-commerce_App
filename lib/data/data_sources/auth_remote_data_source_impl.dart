import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/DTO_models/SignUpResponseDTO.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../endpoints.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, SignUpResponseDTO>> signUp(String name, String phone,
      String email, String password, String confirmPassword) async {
    try {
      final response = await apiManager.postDate(
        Endpoints.signUp,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": confirmPassword,
          "phone": phone,
        },
      );

      if (response.data != null) {
        final signUpResponse = SignUpResponseDTO.fromJson(response.data);

        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          return Right(signUpResponse);
        } else {
          return Left(ServerFailure(errorMessage: signUpResponse.message!));
        }
      } else {
        return Left(ServerFailure(
          errorMessage: "Response is null",
        ));
      }
    } catch (e) {
      print(e.toString());
      return Left(NetworkFailure(errorMessage: "No Internet Connection"));
    }
  }
}

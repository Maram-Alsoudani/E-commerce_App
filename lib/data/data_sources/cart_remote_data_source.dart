import 'package:dartz/dartz.dart';

import '../../domain/entity_models/GetCartResponseEntity.dart';
import '../../domain/failures.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, GetCartResponseEntity>> getCart();
}

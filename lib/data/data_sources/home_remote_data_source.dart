import 'package:dartz/dartz.dart';

import '../../domain/entity_models/BrandResponseEntity.dart';
import '../../domain/entity_models/CategoryResponseEntity.dart';
import '../../domain/entity_models/ProductResponseEntity.dart';
import '../../domain/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, CategoryResponseEntity>> getAllCategories();

  Future<Either<Failure, BrandResponseEntity>> getAllBrands();

  Future<Either<Failure, ProductResponseEntity>> getAllProducts();
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity_models/CategoryResponseEntity.dart';

import '../entity_models/BrandResponseEntity.dart';
import '../failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, CategoryResponseEntity>> getAllCategories();

  Future<Either<Failure, BrandResponseEntity>> getAllBrands();
}

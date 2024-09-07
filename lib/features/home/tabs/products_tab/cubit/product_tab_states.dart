import 'package:e_commerce_app/domain/entity_models/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class ProductTabState {}

class ProductInitialState extends ProductTabState {}

class ProductLoadingState extends ProductTabState {}

class ProductErrorState extends ProductTabState {
  Failure failure;

  ProductErrorState({required this.failure});
}

class ProductSuccessState extends ProductTabState {
  ProductResponseEntity productResponseEntity;

  ProductSuccessState({required this.productResponseEntity});
}

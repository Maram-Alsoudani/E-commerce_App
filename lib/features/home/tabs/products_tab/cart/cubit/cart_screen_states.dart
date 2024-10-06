import 'package:e_commerce_app/domain/entity_models/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class CartScreenState {}

class InitialCartScreenState extends CartScreenState {}

class LoadingCartScreenState extends CartScreenState {}

class ErrorCartScreenState extends CartScreenState {
  Failure failure;

  ErrorCartScreenState({required this.failure});
}

class SuccessCartScreenState extends CartScreenState {
  GetCartResponseEntity getCartResponseEntity;

  SuccessCartScreenState({required this.getCartResponseEntity});
}

class InitialDeleteCartItemState extends CartScreenState {}

class LoadingDeleteCartItemState extends CartScreenState {}

class ErrorDeleteCartItemState extends CartScreenState {
  Failure failure;

  ErrorDeleteCartItemState({required this.failure});
}

class SuccessDeleteCartItemState extends CartScreenState {
  GetCartResponseEntity getCartResponseEntity;

  SuccessDeleteCartItemState({required this.getCartResponseEntity});
}

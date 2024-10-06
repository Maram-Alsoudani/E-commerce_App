import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity_models/GetCartResponseEntity.dart';
import '../failures.dart';
import '../repositories/cart_repository.dart';

@injectable
class DeleteItemInCartUseCase {
  CartRepository cartRepository;

  DeleteItemInCartUseCase({required this.cartRepository});

  Future<Either<Failure, GetCartResponseEntity>> invoke(String productId) {
    return cartRepository.deleteItemInCart(productId);
  }
}

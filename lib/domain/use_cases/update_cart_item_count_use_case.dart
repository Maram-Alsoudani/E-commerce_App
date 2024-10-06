import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity_models/GetCartResponseEntity.dart';
import '../failures.dart';

@injectable
class UpdateCartItemCountUseCase {
  CartRepository cartRepository;

  UpdateCartItemCountUseCase({required this.cartRepository});

  Future<Either<Failure, GetCartResponseEntity>> invoke(
      int count, String productId) {
    return cartRepository.updateCountInCart(productId, count);
  }
}

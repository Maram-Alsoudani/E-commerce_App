import 'package:e_commerce_app/features/home/tabs/products_tab/cart/cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entity_models/GetCartResponseEntity.dart';
import '../../../../../../domain/use_cases/delete_item_in_cart_use_case.dart';
import '../../../../../../domain/use_cases/get_cart_use_case.dart';
import '../../../../../../domain/use_cases/update_cart_item_count_use_case.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenState> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateCartItemCountUseCase updateCartItemCountUseCase;

  CartScreenViewModel({
    required this.getCartUseCase,
    required this.deleteItemInCartUseCase,
    required this.updateCartItemCountUseCase,
  }) : super(InitialCartScreenState());

  List<GetProductsCartEntity> cartProducts = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);
  int numOfCart = 0;
  void getCart() async {
    emit(LoadingCartScreenState());
    var either = await getCartUseCase.invoke();
    either.fold((error) {
      emit(ErrorCartScreenState(failure: error));
    }, (response) {
      cartProducts = response.data!.products ?? [];
      emit(SuccessCartScreenState(getCartResponseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(LoadingDeleteCartItemState());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((error) {
      emit(ErrorDeleteCartItemState(failure: error));
    }, (response) {
      cartProducts = response.data!.products ?? [];
      emit(SuccessCartScreenState(getCartResponseEntity: response));
    });
  }

  void updateItemCart(int count, String productId) async {
    print(productId);
    emit(LoadingCartScreenState());
    var either = await updateCartItemCountUseCase.invoke(count, productId);
    either.fold((error) {
      emit(ErrorCartScreenState(failure: error));
    }, (response) {
      cartProducts = response.data!.products ?? [];
      numOfCart = response.numOfCartItems!.toInt();
      emit(SuccessCartScreenState(getCartResponseEntity: response));
    });
  }
}

import 'package:e_commerce_app/features/home/tabs/products_tab/cart/cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entity_models/GetCartResponseEntity.dart';
import '../../../../../../domain/use_cases/get_cart_use_case.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenState> {
  GetCartUseCase getCartUseCase;

  CartScreenViewModel({required this.getCartUseCase})
      : super(InitialCartScreenState());

  List<GetProductsCartEntity> cartProducts = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

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
}

import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entity_models/ProductResponseEntity.dart';

@injectable
class ProductsTabViewModel extends Cubit<ProductTabState> {
  GetAllProductsUseCase getAllProductsUseCase;

  ProductsTabViewModel({required this.getAllProductsUseCase})
      : super(ProductInitialState());

  static ProductsTabViewModel get(context) => BlocProvider.of(context);
  List<ProductEntity> productsList = [];

  void getAllProducts() async {
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductErrorState(failure: error));
    }, (response) {
      productsList = response.data ?? [];
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }
}

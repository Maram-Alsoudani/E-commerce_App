import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_gridView.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/products_tab_cubit.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsTabViewModel, ProductTabState>(
      bloc: ProductsTabViewModel.get(context)..getAllProducts(),
      builder: (context, state) {
        if (state is ProductSuccessState) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: CustomGridview(
                  scrollDirection: Axis.vertical,
                  widgetsList:
                      state.productResponseEntity.data!.map((productEntity) {
                    return GestureDetector(
                      onTap: () {},
                      child: CustomProductWidget(
                        imageUrl: productEntity.imageCover ?? "",
                        productTitle: productEntity.title ?? "",
                        productDescription: productEntity.description ?? "",
                        price: productEntity.price.toString(),
                        ratingsAverage: productEntity.ratingsAverage.toString(),
                      ),
                    );
                  }).toList(),
                  crossAxisCount: 2,
                  itemCount: state.productResponseEntity.data!.length,
                ),
              ),
            ],
          );
        } else if (state is ProductErrorState) {
          return Text(
            state.failure.errorMessage,
            style: getTextStyle(
                14, FontWeightManager.medium, ColorManager.primary),
          );
        }
        return Center(
            child: CircularProgressIndicator(
          color: ColorManager.primary,
        ));
      },
    );
  }
}

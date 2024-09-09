import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomProductWidget extends StatelessWidget {
  String imageUrl;
  String productTitle;
  String productDescription;
  String price;
  String ratingsAverage;

  CustomProductWidget(
      {required this.imageUrl,
      required this.productTitle,
      required this.productDescription,
      required this.price,
      required this.ratingsAverage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorManager.primary, width: 1.5)),
      child: Column(
        children: [
          Expanded(flex: 1, child: _buildProductImage()),
          Expanded(flex: 1, child: _buildProductDetails(context)),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            placeholder: (context, url) => _buildShimmerEffect(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(ImageAsset.filledHeart),
        ),
      ],
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[350]!,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getTextStyle(
                        12, FontWeightManager.semiBold, ColorManager.darkBlue),
                  ),
                  Text(
                    productDescription,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getTextStyle(
                        12, FontWeightManager.semiBold, ColorManager.darkBlue),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Text("EGP $price",
                    style: getTextStyle(
                        14, FontWeightManager.medium, ColorManager.darkBlue))),
            Expanded(
              flex: 1,
              child: Row(children: [
                Text(
                  "Review ($ratingsAverage)",
                  style: getTextStyle(
                      12, FontWeightManager.medium, ColorManager.darkBlue),
                ),
                Icon(
                  Icons.star,
                  color: ColorManager.yellow,
                  size: 20,
                ),
                Spacer(),
              ]),
            )
          ],
        ));
  }

  Widget _buildAddToCartButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorManager.primary),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          shape: WidgetStateProperty.all(CircleBorder()),
          minimumSize: WidgetStateProperty.all(Size(40, 40))),
      onPressed: () {},
      child: const Icon(
        Icons.add, // Plus icon
        color: Colors.white, // Icon color
        size: 20, // Icon size
      ),
    );
  }
}

//   Expanded(
//               flex: 1,
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                       borderRadius: const BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//                       child: Container(
//                         width: double.infinity,
//                         height: double.infinity,
//                         child: CachedNetworkImage(
//                           imageUrl: imageUrl,
//                           placeholder: (context, url) => Shimmer.fromColors(
//                             baseColor: Colors.grey[300]!,
//                             highlightColor: Colors.grey[350]!,
//                             child: Container(
//                               width: double.infinity,
//                               height: double.infinity,
//                               color: Colors.white,
//                             ),
//                           ),
//                           errorWidget: (context, url, error) =>
//                               Icon(Icons.error),
//                           fit: BoxFit.fill,
//                         ),
//                       )),
//                   Positioned(
//                       top: 0,
//                       right: 0,
//                       child: Image.asset(ImageAsset.filledHeart))
//                 ],
//               )),
//           Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Text(
//                         productTitle,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: getTextStyle(14, FontWeightManager.semiBold,
//                             ColorManager.darkBlue),
//                       ),
//                     ),
//                     Expanded(
//                         flex: 1,
//                         child: Text("EGP $price",
//                             style: getTextStyle(14, FontWeightManager.medium,
//                                 ColorManager.darkBlue))),
//                     Expanded(
//                       flex: 1,
//                       child: Row(
//                         children: [
//                           Text(
//                             "Review ($ratingsAverage)",
//                             style: getTextStyle(12, FontWeightManager.medium,
//                                 ColorManager.darkBlue),
//                           ),
//                           Icon(
//                             Icons.star,
//                             color: ColorManager.yellow,
//                             size: 20,
//                           ),
//                           Spacer(),
//                           ElevatedButton(
//                             style: ButtonStyle(
//                                 backgroundColor: WidgetStateProperty.all(
//                                     ColorManager.primary),
//                                 padding:
//                                     WidgetStateProperty.all(EdgeInsets.zero),
//                                 shape: WidgetStateProperty.all(CircleBorder()),
//                                 minimumSize:
//                                     WidgetStateProperty.all(Size(40, 40))),
//                             onPressed: () {},
//                             child: Icon(
//                               Icons.add, // Plus icon
//                               color: Colors.white, // Icon color
//                               size: 20, // Icon size
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ))

import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_button_navigatio_bar.dart';
import 'package:e_commerce_app/features/home/tabs/categories_tab.dart';
import 'package:e_commerce_app/features/home/tabs/favourites_tab.dart';
import 'package:e_commerce_app/features/home/tabs/home_tab.dart';
import 'package:e_commerce_app/features/home/tabs/user_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widget> tabs = [
    HomeTab(),
    CategoriesTab(),
    FavouritesTabTab(),
    UserTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          leading: Image.asset(ImageAsset.routeLogoBlue),
          leadingWidth: 90,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorManager.primary, // Border color
                            width: 1.5, // Border width
                          ),
                          borderRadius:
                              BorderRadius.circular(25.0), // Border radius
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search_sharp,
                              color: ColorManager.primary,
                              size: 25,
                            ),
                            Expanded(
                              child: TextField(
                                  decoration: InputDecoration(
                                hintText: "What do you search for?",
                                border: InputBorder.none,
                                hintStyle: getTextStyle(
                                    14.0,
                                    FontWeightManager.light,
                                    ColorManager.darkGrey),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                fillColor: Colors.white24,
                                filled: true,
                              )),
                            )
                          ],
                        )),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        color: ColorManager.primary,
                      ))
                ],
              ),
              Expanded(child: tabs[selectedIndex])
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
          clipBehavior: Clip.antiAlias,
          child: CustomBottomNavigationBar(
            backgroundColor: ColorManager.primary,
            unselectedIcons: [
              ImageAsset.homeWhite,
              ImageAsset.categoryWhite,
              ImageAsset.heartWhite,
              ImageAsset.userWhite,
            ],
            selectedIcons: [
              ImageAsset.homeBlue,
              ImageAsset.categoryBlue,
              ImageAsset.heartBlue,
              ImageAsset.userBlue,
            ],
            currentIndex: selectedIndex,
            onItemSelected: (int index) {
              selectedIndex = index;
              setState(() {});
            },
          ),
        ));
  }
}

import 'package:e_commerce_app/features/home/tabs/home_tab/home_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AnnouncementImageSlideshow extends StatelessWidget {
  const AnnouncementImageSlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ImageSlideshow(
        width: double.infinity,
        height: 200,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        autoPlayInterval: 3000,
        isLoop: true,
        onPageChanged: (value) {},
        children: HomeTabViewModel.get(context).sliderImages,
      ),
    );
  }
}

import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';

class OnBoarding {
  String title1;
  String title2;
  String description;
  String image;
  OnBoarding({
    required this.title1,
    required this.title2,
    required this.description,
    required this.image,
  });
}

List<OnBoarding> onBoardingList = [
  OnBoarding(
      title1: 'Save posts of ',
      title2: ' LinkedIn',
      description:
          'Use Share via method and save your post with selected category.',
      image: AssetsManager.linkedIn),
  OnBoarding(
      title1: 'Save posts of ',
      title2: ' FaceBook',
      description:
          'Use Share method and save your post with selected category.',
      image: AssetsManager.facebook),
  OnBoarding(
      title1: 'And ',
      title2: ' Other favorite websites',
      description:
          'X, Youtube, Instagram, and others.',
      image: AssetsManager.others)
];

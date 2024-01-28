import 'package:foochi/app/data/constants/app_assets.dart';

class Onboarding {
  String title1;
  String title2;
  String description;
  String image;
  Onboarding({
    required this.title1,
    required this.title2,
    required this.description,
    required this.image,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
      title1: 'Save posts of',
      title2: 'LinkedIn',
      description:
          'Save LinkedIn posts.',
      image: AppAssets.kOnboardingFirst),
  Onboarding(
      title1: 'Save posts of',
      title2: 'FaceBook',
      description:
          'Save FaceBook posts.',
      image: AppAssets.kOnboardingSecond),
  Onboarding(
      title1: 'And ',
      title2: 'Other favorite websites',
      description:
          'And other favorite websites',
      image: AppAssets.kOnboardingThird)
];

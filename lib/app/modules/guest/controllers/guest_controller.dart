import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakone_pay/app/routes/app_pages.dart';
import '../../../utils/utils.dart';

class GuestController extends GetxController {
  final locale = Get.locale?.obs;
  final listPageView = <Map<String, String>>[].obs;
  final pageController = PageController(initialPage: 999);
  final pageIndex = 0.obs;

  Timer? _t;

  @override
  void onInit() {
    listPageView.value = [
      {
        'image': ImageAssets.kMonas,
        'image_name': 'Monuman Nasional',
        'tagline': AppStrings.kExploreJakartaWithTouristPass,
      },
      {
        'image': ImageAssets.kMonas,
        'image_name': 'Monuman Nasional',
        'tagline': AppStrings.kExploreJakartaWithTouristPass,
      },
      {
        'image': ImageAssets.kMonas,
        'image_name': 'Monuman Nasional',
        'tagline': AppStrings.kExploreJakartaWithTouristPass,
      },
    ];

    autoPlay();
    super.onInit();
  }

  void changeLocale(Locale locale) {
    Get.updateLocale(locale);
    this.locale?.value = locale;
  }

  void onPageChanged(int index) {
    pageIndex.value = index % listPageView.length;
  }

  void autoPlay() async {
    _t = Timer(
      const Duration(seconds: 3),
      () {
        next();
        autoPlay();
      },
    );
  }

  void next() {
    if (pageController.hasClients) {
      pageIndex.value = (pageIndex.value + 1) % listPageView.length;

      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );

      _t?.cancel();
      autoPlay();
    }
  }

  void goToHome() {
    Get.offAllNamed(Routes.home);
  }

  @override
  void onClose() {
    _t?.cancel();
    super.onClose();
  }
}

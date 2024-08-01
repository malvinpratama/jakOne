import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.kSplashscreen),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.kLogoJakartaTouristPassWhite,
                  width: 286.w,
                  height: 89.h,
                ),
              ],
            ),
            Positioned(
              bottom: 12.h,
              child: Text(
                controller.poweredBy.value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 11.6.sp,
                      height: 1.2104,
                      color: Colors.white,
                    ),
              ),
            ),
            Positioned(
              bottom: 54.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    ImageAssets.kLogoOjk,
                    width: 42.53.w,
                    height: 15.47.h,
                  ),
                  23.2.horizontalSpace,
                  Image.asset(
                    ImageAssets.kLogoLps,
                    width: 37.38.w,
                    height: 15.47.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

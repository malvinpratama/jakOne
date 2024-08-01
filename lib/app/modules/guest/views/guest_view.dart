import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../utils/utils.dart';
import '../controllers/guest_controller.dart';

class GuestView extends GetView<GuestController> {
  const GuestView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      final nextLocale =
                          controller.locale?.value == const Locale('id', 'ID')
                              ? const Locale('en', 'US')
                              : const Locale('id', 'ID');
                      controller.changeLocale(nextLocale);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Card(
                          child: SizedBox(
                            width: 46.w,
                            height: 17.h,
                          ),
                        ),
                        Positioned(
                          top: 4.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: controller.locale?.value ==
                                        const Locale('id', 'ID')
                                    ? 1
                                    : 0.5,
                                child: Image.asset(
                                  ImageAssets.kIndonesianFlag,
                                  width: 25.w,
                                  height: 22.h,
                                ),
                              ),
                              6.horizontalSpace,
                              Opacity(
                                opacity: controller.locale?.value ==
                                        const Locale('en', 'US')
                                    ? 1
                                    : 0.5,
                                child: Image.asset(
                                  ImageAssets.kBritishFlag,
                                  width: 23.w,
                                  height: 21.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Card(
                      child: Padding(
                        padding:
                            REdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: Row(
                          children: [
                            ImageIcon(
                              const AssetImage(IconAssets.kCreditCard),
                              size: 10.sp,
                            ),
                            4.horizontalSpace,
                            Image.asset(
                              ImageAssets.kLogoJakcard,
                              width: 25.w,
                              height: 11.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPageView(),
                      16.verticalSpace,
                      _buildIndicator(),
                      36.7.verticalSpace,
                      _buildButtonContinue(context)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 22.3,
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  ImageAssets.kJakcardHelp,
                  width: 90.w,
                  height: 99.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _buildButtonContinue(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.goToHome();
          },
          child: Container(
            height: 46.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(color: ColorAssets.kLemonYellow, width: 2.r),
              gradient: const LinearGradient(
                colors: [
                  ColorAssets.kPastelRed,
                  ColorAssets.kRoyalOrange,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Text(
                AppStrings.kContinueAsGuest.tr,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      height: 1.365,
                      fontFamily: GoogleFonts.nunito().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
        16.verticalSpace,
        InkWell(
          onTap: () {
            controller.goToHome();
          },
          child: Container(
            height: 46.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              border: GradientBoxBorder(
                width: 2.r,
                gradient: const LinearGradient(
                  colors: [
                    ColorAssets.kLemonYellow,
                    ColorAssets.kPastelRed,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            child: Center(
              child: Text(
                AppStrings.kContinueAsGuest.tr,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ColorAssets.kPastelRed,
                      fontFamily: GoogleFonts.nunito().fontFamily,
                      fontWeight: FontWeight.bold,
                      height: 1.365,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: controller.listPageView.mapIndexed(
        (i, element) {
          return Padding(
            padding: REdgeInsets.symmetric(horizontal: 2),
            child: Container(
              width: 4.25.r,
              height: 4.25.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == controller.pageIndex.value
                    ? ColorAssets.kDeepChampagne
                    : ColorAssets.kLinen,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  SizedBox _buildPageView() {
    return SizedBox(
      height: 326.h,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          final data = controller.listPageView[controller.pageIndex.value];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildImageMonas(context, data),
              16.verticalSpace,
              Flexible(
                child: Text(
                  data['tagline']?.tr ?? '',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        height: 1.364,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                        foreground: Paint()
                          ..shader = const LinearGradient(colors: [
                            ColorAssets.kPastelRed,
                            ColorAssets.kRoyalOrange,
                          ]).createShader(Rect.largest),
                      ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildImageMonas(BuildContext context, Map<String, String> data) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 34),
      child: Container(
        width: 275.w,
        height: 286.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(data['image'] ?? '-'),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: REdgeInsets.only(bottom: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ColorAssets.kRoyalOrange,
              ),
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  data['image_name'] ?? '',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.365,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

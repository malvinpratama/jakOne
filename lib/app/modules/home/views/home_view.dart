import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import '../../../utils/utils.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 196.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            ColorAssets.kPastelRed,
                            ColorAssets.kRoyalOrange,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.r),
                          bottomRight: Radius.circular(50.r),
                        ),
                      ),
                    ),
                    _buildAppBar(context),
                  ],
                ),
                _buildMenu(context),
                _buildBanner(),
                32.verticalSpace,
                _buildHeaderLandmark(context),
                16.verticalSpace,
                Obx(
                  () => Column(
                    children: [
                      _buildLandmark(),
                      20.verticalSpace,
                      _buildLandmarkIndicator()
                    ],
                  ),
                ),
                20.verticalSpace,
                _buildHeaderEvent(context),
                Obx(
                  () => Column(
                    children: [
                      16.verticalSpace,
                      _buildEvent(),
                      20.verticalSpace,
                      _buildEventIndicator()
                    ],
                  ),
                ),
                127.75.verticalSpace,
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 38.h,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 64.r,
        height: 64.r,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [
                ColorAssets.kTartOrange,
                ColorAssets.kRoyalOrange,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(
              color: ColorAssets.kLavenderBlush,
              width: 2.r,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(00, 4),
              )
            ]),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          onPressed: () {},
          child: Padding(
            padding: REdgeInsets.all(12),
            child: Image.asset(
              ImageAssets.kLogoQris,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(00, -2),
              )
            ]),
        child: BottomAppBar(
          color: Colors.transparent,
          padding: EdgeInsets.zero,
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => const LinearGradient(
                    colors: [
                      ColorAssets.kTartOrange,
                      ColorAssets.kRoyalOrange,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds),
                  child: ImageIcon(
                    const AssetImage(IconAssets.kHome),
                    size: 24.sp,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => const LinearGradient(
                    colors: [
                      ColorAssets.kTartOrange,
                      ColorAssets.kRoyalOrange,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds),
                  child: ImageIcon(
                    const AssetImage(IconAssets.kProfileUser),
                    size: 24.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildLandmarkIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: controller.listLandmark.mapIndexed(
        (i, element) {
          return Padding(
            padding: REdgeInsets.symmetric(horizontal: 2),
            child: Container(
              width: 4.25.r,
              height: 4.25.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == controller.pageIndexLandmark.value
                    ? ColorAssets.kPastelRed
                    : ColorAssets.kRoyalOrange,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Row _buildEventIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: controller.listEvent.mapIndexed(
        (i, element) {
          return Padding(
            padding: REdgeInsets.symmetric(horizontal: 2),
            child: Container(
              width: 4.25.r,
              height: 4.25.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == controller.pageIndexEvent.value
                    ? ColorAssets.kPastelRed
                    : ColorAssets.kRoyalOrange,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  SizedBox _buildLandmark() {
    return SizedBox(
      width: 1.sw,
      height: 150.h,
      child: InfiniteCarousel.builder(
        itemCount: controller.listLandmark.length,
        itemExtent: 121.w,
        loop: false,
        center: true,
        controller: controller.pageControllerLandmark,
        onIndexChanged: (index) {
          controller.onChangePageIndexLandmark(index);
        },
        itemBuilder: (context, itemIndex, realIndex) {
          final data = controller.listLandmark[itemIndex];
          if (itemIndex == 0) {
            return Padding(
              padding: REdgeInsets.symmetric(horizontal: 11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['image_name'] ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                          fontFamily: GoogleFonts.paytoneOne().fontFamily,
                          height: 1.067,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  8.verticalSpace,
                  Image.asset(
                    ImageAssets.kMap,
                    width: 68.w,
                    height: 62.h,
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: REdgeInsets.symmetric(horizontal: 11),
              child: InkWell(
                onTap: () {},
                child: Card(
                  child: Container(
                    width: 99.w,
                    height: 142.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 99.r,
                          height: 99.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                            ),
                            image: DecorationImage(
                              image: AssetImage(data['image'] ?? ''),
                            ),
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['image_name'] ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.nunito().fontFamily,
                                      height: 1.364,
                                    ),
                              ),
                              4.verticalSpace,
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        ColorAssets.kPastelRed,
                                        ColorAssets.kRoyalOrange,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    border: Border.all(
                                      color: ColorAssets.kLemonYellow,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  child: Padding(
                                    padding: REdgeInsets.symmetric(
                                        horizontal: 4, vertical: 1),
                                    child: Text(
                                      AppStrings.kDetail,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                              fontSize: 7.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: GoogleFonts.nunito()
                                                  .fontFamily,
                                              height: 1.365,
                                              color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  SizedBox _buildEvent() {
    return SizedBox(
      width: 1.sw,
      height: 150.h,
      child: InfiniteCarousel.builder(
        itemCount: controller.listEvent.length,
        itemExtent: 191.w,
        loop: true,
        center: true,
        controller: controller.pageControllerEvent,
        onIndexChanged: (index) {
          controller.onChangePageIndexEvent(index);
        },
        itemBuilder: (context, itemIndex, realIndex) {
          final data = controller.listEvent[itemIndex];

          return Padding(
            padding: REdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 191.w,
                height: 150.84.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorAssets.kPastelRed,
                        ColorAssets.kRoyalOrange,
                        Colors.white.withOpacity(0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding: REdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        data['image'] ?? '',
                        width: 171.w,
                        height: 116.h,
                      ),
                      10.horizontalSpace,
                      Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                ColorAssets.kPastelRed,
                                ColorAssets.kRoyalOrange,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            border: Border.all(
                              color: ColorAssets.kLemonYellow,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: REdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            AppStrings.kMoreInformation.tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    fontSize: 7.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                    height: 1.365,
                                    color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Row _buildHeaderLandmark(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  ColorAssets.kPastelRed,
                  ColorAssets.kRoyalOrange,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: const Border(
                top: BorderSide(color: ColorAssets.kMaizeCrayola, width: 1),
                right: BorderSide(color: ColorAssets.kMaizeCrayola, width: 1),
                bottom: BorderSide(color: ColorAssets.kMaizeCrayola, width: 1),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100.r),
                bottomRight: Radius.circular(100.r),
              )),
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: const ImageIcon(
              AssetImage(IconAssets.kLandmark),
              color: Colors.white,
            ),
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.kLetsGoWithJakartaTouristPass.tr,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.nunito().fontFamily,
                      height: 1.067,
                    ),
                textAlign: TextAlign.center,
              ),
              Text(
                AppStrings.kAPlaceNotToBeMissed.tr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: GoogleFonts.nunito().fontFamily,
                      height: 1.067,
                    ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 37.w,
                height: 2.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorAssets.kLemonYellow,
                      ColorAssets.kPastelRed,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.kViewAll.tr,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }

  Row _buildHeaderEvent(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  ColorAssets.kPastelRed,
                  ColorAssets.kRoyalOrange,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: const Border(
                top: BorderSide(color: ColorAssets.kMaizeCrayola, width: 1),
                right: BorderSide(color: ColorAssets.kMaizeCrayola, width: 1),
                bottom: BorderSide(color: ColorAssets.kMaizeCrayola, width: 1),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100.r),
                bottomRight: Radius.circular(100.r),
              )),
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: const ImageIcon(
              AssetImage(IconAssets.kCalendar),
              color: Colors.white,
            ),
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.kEventInJakarta.tr,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.nunito().fontFamily,
                      height: 1.067,
                    ),
                textAlign: TextAlign.center,
              ),
              Text(
                AppStrings.kDontMissTheCurrentEvents.tr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: GoogleFonts.nunito().fontFamily,
                      height: 1.067,
                    ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 37.w,
                height: 2.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorAssets.kLemonYellow,
                      ColorAssets.kPastelRed,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.kViewAll.tr,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }

  SizedBox _buildBanner() {
    return SizedBox(
      height: 91.h,
      child: InfiniteCarousel.builder(
        itemCount: 2,
        itemExtent: 298.w,
        itemBuilder: (context, itemIndex, realIndex) {
          return InkWell(
            onTap: () {},
            child: Container(
              width: 298.w,
              height: 91.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.kBanner),
                ),
              ),
              child: Padding(
                padding: REdgeInsets.only(top: 12),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Text(
                      '#${AppStrings.kIniJakarta.tr}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 0.75,
                            fontFamily: GoogleFonts.nunito().fontFamily,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = ColorAssets.kRoyalOrange,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '#${AppStrings.kIniJakarta.tr}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 0.75,
                            fontFamily: GoogleFonts.nunito().fontFamily,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _buildMenu(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 16.5, horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    gradient: const LinearGradient(
                      colors: [
                        ColorAssets.kLumber,
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          ColorAssets.kLemonYellow,
                          ColorAssets.kPastelRed,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: REdgeInsets.fromLTRB(10, 7.5, 5, 7.5),
                    child: Image.asset(
                      ImageAssets.kExploreJakarta.tr,
                      width: 47.r,
                      height: 47.r,
                    ),
                  ),
                ),
                Text(
                  AppStrings.kExploreJakarta.tr,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 8.sp,
                        height: 2,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    gradient: const LinearGradient(
                      colors: [
                        ColorAssets.kLumber,
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          ColorAssets.kLemonYellow,
                          ColorAssets.kPastelRed,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: REdgeInsets.all(7),
                    child: Image.asset(
                      ImageAssets.kTopupJakcard,
                      width: 48.r,
                      height: 48.r,
                    ),
                  ),
                ),
                Text(
                  AppStrings.kTopUpJakCard.tr,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 8.sp,
                        height: 2,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    gradient: const LinearGradient(
                      colors: [
                        ColorAssets.kLumber,
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          ColorAssets.kLemonYellow,
                          ColorAssets.kPastelRed,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: REdgeInsets.fromLTRB(13, 8, 14, 10),
                    child: Image.asset(
                      ImageAssets.kJakcardBalance,
                      width: 41.r,
                      height: 44.r,
                    ),
                  ),
                ),
                Text(
                  AppStrings.kJakCardBalance.tr,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 8.sp,
                        height: 2,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    gradient: const LinearGradient(
                      colors: [
                        ColorAssets.kLumber,
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          ColorAssets.kLemonYellow,
                          ColorAssets.kPastelRed,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: REdgeInsets.all(13.5),
                    child: Image.asset(
                      ImageAssets.kEvent,
                      width: 35.r,
                      height: 35.r,
                    ),
                  ),
                ),
                Text(
                  AppStrings.kEvent.tr,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 8.sp,
                        height: 2,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SafeArea _buildAppBar(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ImageAssets.kLogoJakartaTouristPassWhite,
                  width: 119.w,
                  height: 39.h,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 27.r,
                        height: 27.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              ColorAssets.kTartOrange.withOpacity(0.7),
                              ColorAssets.kLemonYellow.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: ImageIcon(
                            const AssetImage(IconAssets.kFile),
                            size: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 27.r,
                        height: 27.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              ColorAssets.kTartOrange.withOpacity(0.7),
                              ColorAssets.kLemonYellow.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: ImageIcon(
                            const AssetImage(IconAssets.kRoundNotifications),
                            size: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            16.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ImageIcon(
                    const AssetImage(IconAssets.kProfileUser),
                    color: Colors.white,
                    size: 38.sp,
                  ),
                ),
                16.horizontalSpace,
                Text(
                  AppStrings.kGoodMorning.trParams({
                    'name': 'Guest',
                  }),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.364,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                )
              ],
            ),
            12.verticalSpace,
            _buildBalanceCard(context),
          ],
        ),
      ),
    );
  }

  SizedBox _buildBalanceCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 82.h,
      child: Card(
        child: Row(
          children: [
            Container(
              width: 11.w,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  topLeft: Radius.circular(10.r),
                ),
                gradient: const LinearGradient(
                  colors: [
                    ColorAssets.kPastelRed,
                    ColorAssets.kLemonYellow,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            21.horizontalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.kBalanceAccount.tr,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 10.sp,
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                  ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Rp ',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      fontSize: 13.sp,
                                      letterSpacing: -0.011,
                                    ),
                              ),
                              TextSpan(
                                text: CurrencyFormatter.idr(0),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      letterSpacing: -0.011,
                                      fontWeight: FontWeight.w500,
                                    ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '-',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    height: 1,
                                    letterSpacing: -0.011,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                  ),
                        )
                      ],
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: ColorAssets.kLemonYellow),
                            gradient: const LinearGradient(
                              colors: [
                                ColorAssets.kBrinkPink,
                                ColorAssets.kRoyalOrange,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Padding(
                            padding: REdgeInsets.all(8),
                            child: Text(
                              AppStrings.kTopUp.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    height: 1.334,
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

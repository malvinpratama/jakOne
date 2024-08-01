import 'package:get/get.dart';

import '../modules/guest/bindings/guest_binding.dart';
import '../modules/guest/views/guest_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashscreen;

  static final routes = [
    GetPage(
      name: _Paths.splashscreen,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.guest,
      page: () => const GuestView(),
      binding: GuestBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

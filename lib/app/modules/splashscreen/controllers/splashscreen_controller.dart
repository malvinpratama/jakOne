import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  final poweredBy = 'powered by Bank DKI\n2023'.obs;
  @override
  void onInit() {
    3.seconds.delay().then(
      (_) {
        Get.offAllNamed(Routes.guest);
      },
    );
    super.onInit();
  }
}

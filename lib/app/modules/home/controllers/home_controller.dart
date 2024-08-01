import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../../../utils/utils.dart';

class HomeController extends GetxController {
  final listLandmark = <Map<String, String>>[].obs;
  final pageControllerLandmark = InfiniteScrollController(initialItem: 1);
  final pageIndexLandmark = 1.obs;
    final listEvent= <Map<String, String>>[].obs;
  final pageControllerEvent = InfiniteScrollController(initialItem: 0);
  final pageIndexEvent = 1.obs;

  @override
  void onInit() {
    listLandmark.value = [
      {
        'image': ImageAssets.kMap,
        'image_name': 'Did You\nKnow ?',
      },
      {
        'image': ImageAssets.kAncol,
        'image_name': 'Ancol Entrance Gate',
      },
      {
        'image': ImageAssets.kMonumenNasional,
        'image_name': 'Monumen Nasional',
      },
      {
        'image': ImageAssets.kRagunan,
        'image_name': 'Ragunan Zoo',
      },
    ];
    listEvent.value = [
      {
        'image': ImageAssets.kVangogh,
      },
      {
        'image': ImageAssets.kFlameRises,
      },
    ];
    super.onInit();
  }

  onChangePageIndexLandmark(int index) {
    pageIndexLandmark.value = index;
  }

  onChangePageIndexEvent(int index) {
    pageIndexEvent.value = index;
  }
}

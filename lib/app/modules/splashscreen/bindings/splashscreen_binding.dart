import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut(() => SplashscreenController()),
      ];
}

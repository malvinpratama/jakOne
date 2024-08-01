import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut<HomeController>(() => HomeController()),
      ];
}

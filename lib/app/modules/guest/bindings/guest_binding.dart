import 'package:get/get.dart';

import '../controllers/guest_controller.dart';

class GuestBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut<GuestController>(() => GuestController()),
      ];
}

import 'package:get/get.dart';

import '../controllers/hamper_controller.dart';

class HamperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HamperController>(
      () => HamperController(),
    );
  }
}

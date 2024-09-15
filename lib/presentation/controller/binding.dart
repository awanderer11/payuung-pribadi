import 'package:get/get.dart';
import 'package:payuung_pribadi/presentation/controller/local.dart';
import 'package:payuung_pribadi/presentation/controller/user.dart';

class InitialBin extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(StorageContrroller());
  }
}

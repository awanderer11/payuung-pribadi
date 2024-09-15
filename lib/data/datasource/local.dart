import 'dart:developer';
import 'package:get_storage/get_storage.dart';

abstract class AppStorage {
  static const String user = 'user';
}

enum Method { write, read, delete }

class StorageConnect {
  request(
    final Method method,
    final dynamic val,
    final String name,
  ) async {
    if (method == Method.write) {
      await GetStorage().write(name, val);
      log("write $name");
    } else if (method == Method.read) {
      log("read $name");
      return await GetStorage().read(name);
    } else if (method == Method.delete) {
      await GetStorage().remove(name);
      log("remove $name");
    }
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:payuung_pribadi/data/datasource/local.dart';

class StorageContrroller extends GetxController {
  final RxList list = [].obs;
  final isLoad = false.obs;
  writeStorage(Map<String, dynamic> json, String routes) async {
    await readStorage(routes);
    list.add(json);
    log(list.toString());
    var listMap = list.map((element) => element).toList();
    StorageConnect().request(Method.write, jsonEncode(listMap), routes);
  }

  readStorage(String routes) async {
    isLoad.value = true;
    final res = await StorageConnect().request(Method.read, {}, routes);
    log(res.toString());
    final map = res == null ? [] : jsonDecode(res);
    list.clear();
    list.addAll(map);
    log(list.toString());
    isLoad.value = false;
  }

  removeStorage(String routes) async {
    await StorageConnect().request(Method.delete, {}, routes);
    list.clear();
  }
}

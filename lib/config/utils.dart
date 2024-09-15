import 'dart:convert';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Utils {
  Future<String> xFileToBlob(XFile xFile) async {
    return base64Encode(await xFile.readAsBytes());
  }

  Uint8List blobToImageMemory(String source) {
    return base64Decode(source);
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi';
    }
    if (hour < 17) {
      return 'Selamat Siang';
    }
    return 'Selamat Malam';
  }

  String toRp(double number) {
    return NumberFormat.currency(
      locale: 'id_ID',
      decimalDigits: 0,
      symbol: "Rp",
    ).format(number);
  }

  String getInitial(String text) {
    return (text.isEmpty)
        ? 'P'
        : text.trim().split(' ').map((l) => l[0]).take(2).join().toUpperCase();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:payuung_pribadi/config/utils.dart';
import 'package:payuung_pribadi/data/datasource/local.dart';
import 'package:payuung_pribadi/data/model/user.dart';
import 'package:payuung_pribadi/presentation/controller/local.dart';

class UserController extends GetxController {
  final namalengkap = TextEditingController();
  final tanggallahir = TextEditingController();
  final jeniskelamin = TextEditingController();
  final alamatemail = TextEditingController();
  final nohp = TextEditingController();
  final pendidikan = TextEditingController();
  final statusperkawinan = TextEditingController();
  //
  final RxString fotoktp = "".obs;
  final nik = TextEditingController();
  final alamatktp = TextEditingController();
  final provinsiktp = TextEditingController();
  final kotaktp = TextEditingController();
  final kelurahanktp = TextEditingController();
  final kecamatanktp = TextEditingController();
  final kodeposktp = TextEditingController();
  final alamatdomisili = TextEditingController();
  final provinsidomisili = TextEditingController();
  final kotadomisili = TextEditingController();
  final kelurahandomisili = TextEditingController();
  final kecamatandomisili = TextEditingController();
  final kodeposdomisili = TextEditingController();
  //
  final namausaha = TextEditingController();
  final alamatusaha = TextEditingController();
  final jabatan = TextEditingController();
  final lamabekerja = TextEditingController();
  final sumberpenghasilan = TextEditingController();
  final pendapatankotor = TextEditingController();
  final namabank = TextEditingController();
  final cabangbank = TextEditingController();
  final nomorrekening = TextEditingController();
  final namapemilik = TextEditingController();
  //
  final RxString file = "".obs;
  final _imagePicker = ImagePicker();
  //
  final Rx<UserModel> userModel = UserModel().obs;

  pickDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2100));
    if (picked != null) {
      String formattedDate = DateFormat('dd MMMM yyyy').format(picked);
      tanggallahir.text = formattedDate;
    }
  }

  void startPhoto({int type = 0}) async {
    final xFile = await startSource(type: type);
    if (xFile == null) return;
    file.value = await Utils().xFileToBlob(xFile);
    fotoktp.value = "KTP.${xFile.path.split(".").last}";
  }

  Future<XFile?> startSource({int type = 0}) async {
    var source = ImageSource.gallery;
    if (type == 0) {
      source = ImageSource.camera;
    }

    final xFile = await _imagePicker.pickImage(
      source: source,
      imageQuality: 70,
    );

    if (xFile == null) return null;
    return xFile;
  }

  save() {
    Get.find<StorageContrroller>().writeStorage(
      UserModel(
        user: User(
          biodata: Biodata(
              namalengkap: namalengkap.text,
              tanggallahir: tanggallahir.text,
              jeniskelamin: jeniskelamin.text,
              alamatemail: alamatemail.text,
              nohp: nohp.text,
              pendidikan: pendidikan.text,
              statusperkawinan: statusperkawinan.text),
          alamatpribadi: Alamatpribadi(
              fotoktp: fotoktp.value,
              nik: nik.text,
              alamatktp: alamatktp.text,
              provinsiktp: provinsiktp.text,
              kotaktp: kotaktp.text,
              kelurahanktp: kelurahanktp.text,
              kecamatanktp: kecamatanktp.text,
              kodeposktp: kodeposktp.text,
              alamatdomisili: alamatdomisili.text,
              provinsidomisili: provinsidomisili.text,
              kotadomisili: kotadomisili.text,
              kelurahandomisili: kelurahandomisili.text,
              kecamatandomisili: kecamatandomisili.text,
              kodeposdomisili: kodeposdomisili.text),
          informasiperusahaan: Informasiperusahaan(
            namausaha: namausaha.text,
            alamatusaha: alamatusaha.text,
            jabatan: jabatan.text,
            lamabekerja: lamabekerja.text,
            sumberpenghasilan: sumberpenghasilan.text,
            pendapatankotor: pendapatankotor.text,
            namabank: namabank.text,
            cabangbank: cabangbank.text,
            nomorrekening: nomorrekening.text,
            namapemilik: namapemilik.text,
          ),
        ),
      ).toJson(),
      AppStorage.user,
    );
  }
}

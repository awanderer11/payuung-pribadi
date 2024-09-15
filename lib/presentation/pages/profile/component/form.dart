import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/config/const.dart';
import 'package:payuung_pribadi/presentation/controller/user.dart';
import 'package:payuung_pribadi/presentation/pages/profile/component/drop.dart';
import 'package:payuung_pribadi/presentation/pages/profile/component/field.dart';
import 'package:payuung_pribadi/presentation/pages/profile/profileupdate.dart';
import 'package:payuung_pribadi/presentation/widget/text.dart';

List<String> listjeniskelamin = <String>['LAKI-LAKI', 'PEREMPUAN'];
List<String> listpendidikan = <String>['SD', 'SMP', "SMA", "SARJANA"];
List<String> liststatuspenikahan = <String>['KAWIN', 'BELUM KAWIN'];

class Biodata extends GetView<UserController> {
  const Biodata({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FieldWidget(
              name: "NAMA LENGKAP",
              textEditingController: controller.namalengkap,
            ),
            FieldWidget(
              onTap: () => controller.pickDate(),
              iconData: Icons.calendar_month,
              readOnly: true,
              name: "TANGGAL LAHIR",
              textEditingController: controller.tanggallahir,
            ),
            DropWidget(
              onChanged: (p0) => controller.jeniskelamin.text = p0!,
              items: listjeniskelamin
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: TextWidget(title: item),
                    ),
                  )
                  .toList(),
              name: "JENIS KELAMIN",
            ),
            FieldWidget(
              name: "ALAMAT EMAIL",
              textEditingController: controller.alamatemail,
            ),
            FieldWidget(
              name: "NO.HP",
              textEditingController: controller.nohp,
            ),
            DropWidget(
              onChanged: (p0) => controller.pendidikan.text = p0!,
              items: listpendidikan
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: TextWidget(title: item),
                    ),
                  )
                  .toList(),
              name: "PENDIDIKAN",
            ),
            DropWidget(
              onChanged: (p0) => controller.statusperkawinan.text = p0!,
              items: liststatuspenikahan
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: TextWidget(title: item),
                    ),
                  )
                  .toList(),
              name: "STATUS PERKAWINAN",
            ),
            PageIndicator(
              tabController: tabController,
              currentPageIndex: currentPageIndex,
              onUpdateCurrentPageIndex: onUpdateCurrentPageIndex,
            )
          ],
        ),
      ),
    );
  }
}

List<String> listprovinsi = <String>['SULAWESI SELATAN'];
List<String> listkota = <String>['MAKASSAR'];
List<String> listkelurahan = <String>['UJUNG PANDANG'];
List<String> listkecamatan = <String>['LAJANGIRU'];

class AlamatPribadi extends StatefulWidget {
  const AlamatPribadi({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  State<AlamatPribadi> createState() => _AlamatPribadiState();
}

class _AlamatPribadiState extends State<AlamatPribadi> {
  bool isSame = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (controller) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: backGroundColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => controller.startPhoto(),
                          child: const KTP(),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Obx(
                          () {
                            if (controller.file.isEmpty) {
                              return const TextWidget(title: "Upload KTP");
                            } else {
                              return Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TextWidget(title: "Upload KTP"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.fotoktp.value.trimLeft(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    FieldWidget(
                      name: "NIK",
                      textEditingController: controller.nik,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              FieldWidget(
                name: "ALAMAT SEUSAI KTP",
                textEditingController: controller.alamatktp,
              ),
              DropWidget(
                onChanged: (p0) => controller.provinsiktp.text = p0!,
                items: listprovinsi
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: TextWidget(title: item),
                      ),
                    )
                    .toList(),
                name: "PROVINSI",
              ),
              DropWidget(
                onChanged: (p0) => controller.kotaktp.text = p0!,
                items: listkota
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: TextWidget(title: item),
                      ),
                    )
                    .toList(),
                name: "KOTA/KABUPATEN",
              ),
              DropWidget(
                onChanged: (p0) => controller.kecamatanktp.text = p0!,
                items: listkecamatan
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: TextWidget(title: item),
                      ),
                    )
                    .toList(),
                name: "KECAMATAN",
              ),
              DropWidget(
                onChanged: (p0) => controller.kelurahanktp.text = p0!,
                items: listkelurahan
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: TextWidget(title: item),
                      ),
                    )
                    .toList(),
                name: "KELURAHAN",
              ),
              FieldWidget(
                name: "KODE POS",
                textEditingController: controller.kodeposktp,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: Checkbox(
                      activeColor: primaryColor,
                      checkColor: Colors.white,
                      value: isSame,
                      onChanged: (v) {
                        setState(
                          () {
                            isSame = !isSame;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const TextWidget(title: "Alamat domisili sama dengan KTP")
                ],
              ),
              Builder(
                builder: (context) {
                  if (isSame == false) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        FieldWidget(
                          name: "ALAMAT DOMISILI",
                          textEditingController: controller.alamatdomisili,
                        ),
                        DropWidget(
                          onChanged: (p0) =>
                              controller.provinsidomisili.text = p0!,
                          items: listprovinsi
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: TextWidget(title: item),
                                ),
                              )
                              .toList(),
                          name: "PROVINSI",
                        ),
                        DropWidget(
                          onChanged: (p0) => controller.kotadomisili.text = p0!,
                          items: listkota
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: TextWidget(title: item),
                                ),
                              )
                              .toList(),
                          name: "KOTA/KABUPATEN",
                        ),
                        DropWidget(
                          onChanged: (p0) =>
                              controller.kecamatandomisili.text = p0!,
                          items: listkecamatan
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: TextWidget(title: item),
                                ),
                              )
                              .toList(),
                          name: "KECAMATAN",
                        ),
                        DropWidget(
                          onChanged: (p0) =>
                              controller.kelurahandomisili.text = p0!,
                          items: listkelurahan
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: TextWidget(title: item),
                                ),
                              )
                              .toList(),
                          name: "KELURAHAN",
                        ),
                        FieldWidget(
                          name: "KODE POS",
                          textEditingController: controller.kodeposdomisili,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    );
                  } else {
                    return const Offstage();
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              PageIndicator(
                tabController: widget.tabController,
                currentPageIndex: widget.currentPageIndex,
                onUpdateCurrentPageIndex: widget.onUpdateCurrentPageIndex,
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> listjabatan = <String>['MANAGER'];
List<String> listlamabekerja = <String>['< 6 BULAN>'];
List<String> listsumberpendapatan = <String>['GAJI'];
List<String> listpendapatankotor = <String>['< 10 JUTA'];
List<String> listnamabank = <String>['BCA', "BRI", "MANDIRI"];

class InformasiPerusahaan extends GetView<UserController> {
  const InformasiPerusahaan({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FieldWidget(
              name: "NAMA USAHA/PERUSAHAAN",
              isRequired: false,
              textEditingController: controller.namausaha,
            ),
            FieldWidget(
              name: "ALAMAT USAHA/PERUSAHAAN",
              isRequired: false,
              textEditingController: controller.alamatusaha,
            ),
            DropWidget(
              isRequired: false,
              onChanged: (p0) => controller.jabatan.text = p0!,
              items: listjabatan
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: TextWidget(title: item),
                    ),
                  )
                  .toList(),
              name: "JABATAN",
            ),
            DropWidget(
              isRequired: false,
              onChanged: (p0) => controller.lamabekerja.text = p0!,
              items: listlamabekerja
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: TextWidget(title: item),
                    ),
                  )
                  .toList(),
              name: "LAMA BEKERJA",
            ),
            DropWidget(
              isRequired: false,
              onChanged: (p0) => controller.sumberpenghasilan.text = p0!,
              items: listsumberpendapatan
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: TextWidget(title: item),
                    ),
                  )
                  .toList(),
              name: "SUMBER PENDAPATAN",
            ),
            DropWidget(
              isRequired: false,
              onChanged: (p0) => controller.pendapatankotor.text = p0!,
              items: listpendapatankotor
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: TextWidget(title: item),
                    ),
                  )
                  .toList(),
              name: "PENDAPATAN KOTOR PERTAHAN",
            ),
            DropWidget(
              isRequired: false,
              onChanged: (p0) => controller.namabank.text = p0!,
              items: listnamabank
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: TextWidget(title: item),
                    ),
                  )
                  .toList(),
              name: "NAMA BANK",
            ),
            FieldWidget(
              name: "CABANG BANK",
              isRequired: false,
              textEditingController: controller.cabangbank,
            ),
            FieldWidget(
              name: "NOMOR REKENING",
              isRequired: false,
              textEditingController: controller.nomorrekening,
            ),
            FieldWidget(
              name: "NAMA PEMILIK REKENING",
              isRequired: false,
              textEditingController: controller.namapemilik,
            ),
            PageIndicator(
              tabController: tabController,
              currentPageIndex: currentPageIndex,
              onUpdateCurrentPageIndex: onUpdateCurrentPageIndex,
            )
          ],
        ),
      ),
    );
  }
}

class KTP extends StatelessWidget {
  const KTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
          child: Icon(
        Icons.medical_information_outlined,
        color: Colors.white,
      )),
    );
  }
}

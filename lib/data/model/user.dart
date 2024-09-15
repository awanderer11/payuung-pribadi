class UserModel {
  UserModel({
    this.user,
  });

  final User? user;

  UserModel copyWith({
    User? user,
  }) {
    return UserModel(
      user: user ?? this.user,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  User({
    required this.biodata,
    required this.alamatpribadi,
    required this.informasiperusahaan,
  });

  final Biodata? biodata;
  final Alamatpribadi? alamatpribadi;
  final Informasiperusahaan? informasiperusahaan;

  User copyWith({
    Biodata? biodata,
    Alamatpribadi? alamatpribadi,
    Informasiperusahaan? informasiperusahaan,
  }) {
    return User(
      biodata: biodata ?? this.biodata,
      alamatpribadi: alamatpribadi ?? this.alamatpribadi,
      informasiperusahaan: informasiperusahaan ?? this.informasiperusahaan,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      biodata:
          json["biodata"] == null ? null : Biodata.fromJson(json["biodata"]),
      alamatpribadi: json["alamatpribadi"] == null
          ? null
          : Alamatpribadi.fromJson(json["alamatpribadi"]),
      informasiperusahaan: json["informasiperusahaan"] == null
          ? null
          : Informasiperusahaan.fromJson(json["informasiperusahaan"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "biodata": biodata?.toJson(),
        "alamatpribadi": alamatpribadi?.toJson(),
        "informasiperusahaan": informasiperusahaan?.toJson(),
      };
}

class Alamatpribadi {
  Alamatpribadi({
    required this.fotoktp,
    required this.nik,
    required this.alamatktp,
    required this.provinsiktp,
    required this.kotaktp,
    required this.kelurahanktp,
    required this.kecamatanktp,
    required this.kodeposktp,
    required this.alamatdomisili,
    required this.provinsidomisili,
    required this.kotadomisili,
    required this.kelurahandomisili,
    required this.kecamatandomisili,
    required this.kodeposdomisili,
  });

  final String? fotoktp;
  final String? nik;
  final String? alamatktp;
  final String? provinsiktp;
  final String? kotaktp;
  final String? kelurahanktp;
  final String? kecamatanktp;
  final String? kodeposktp;
  final String? alamatdomisili;
  final String? provinsidomisili;
  final String? kotadomisili;
  final String? kelurahandomisili;
  final String? kecamatandomisili;
  final String? kodeposdomisili;

  Alamatpribadi copyWith({
    String? fotoktp,
    String? nik,
    String? alamatktp,
    String? provinsiktp,
    String? kotaktp,
    String? kelurahanktp,
    String? kecamatanktp,
    String? kodeposktp,
    String? alamatdomisili,
    String? provinsidomisili,
    String? kotadomisili,
    String? kelurahandomisili,
    String? kecamatandomisili,
    String? kodeposdomisili,
  }) {
    return Alamatpribadi(
      fotoktp: fotoktp ?? this.fotoktp,
      nik: nik ?? this.nik,
      alamatktp: alamatktp ?? this.alamatktp,
      provinsiktp: provinsiktp ?? this.provinsiktp,
      kotaktp: kotaktp ?? this.kotaktp,
      kelurahanktp: kelurahanktp ?? this.kelurahanktp,
      kecamatanktp: kecamatanktp ?? this.kecamatanktp,
      kodeposktp: kodeposktp ?? this.kodeposktp,
      alamatdomisili: alamatdomisili ?? this.alamatdomisili,
      provinsidomisili: provinsidomisili ?? this.provinsidomisili,
      kotadomisili: kotadomisili ?? this.kotadomisili,
      kelurahandomisili: kelurahandomisili ?? this.kelurahandomisili,
      kecamatandomisili: kecamatandomisili ?? this.kecamatandomisili,
      kodeposdomisili: kodeposdomisili ?? this.kodeposdomisili,
    );
  }

  factory Alamatpribadi.fromJson(Map<String, dynamic> json) {
    return Alamatpribadi(
      fotoktp: json["fotoktp"],
      nik: json["nik"],
      alamatktp: json["alamatktp"],
      provinsiktp: json["provinsiktp"],
      kotaktp: json["kotaktp"],
      kelurahanktp: json["kelurahanktp"],
      kecamatanktp: json["kecamatanktp"],
      kodeposktp: json["kodeposktp"],
      alamatdomisili: json["alamatdomisili"],
      provinsidomisili: json["provinsidomisili"],
      kotadomisili: json["kotadomisili"],
      kelurahandomisili: json["kelurahandomisili"],
      kecamatandomisili: json["kecamatandomisili"],
      kodeposdomisili: json["kodeposdomisili"],
    );
  }

  Map<String, dynamic> toJson() => {
        "fotoktp": fotoktp,
        "nik": nik,
        "alamatktp": alamatktp,
        "provinsiktp": provinsiktp,
        "kotaktp": kotaktp,
        "kelurahanktp": kelurahanktp,
        "kecamatanktp": kecamatanktp,
        "kodeposktp": kodeposktp,
        "alamatdomisili": alamatdomisili,
        "provinsidomisili": provinsidomisili,
        "kotadomisili": kotadomisili,
        "kelurahandomisili": kelurahandomisili,
        "kecamatandomisili": kecamatandomisili,
        "kodeposdomisili": kodeposdomisili,
      };
}

class Biodata {
  Biodata({
    required this.namalengkap,
    required this.tanggallahir,
    required this.jeniskelamin,
    required this.alamatemail,
    required this.nohp,
    required this.pendidikan,
    required this.statusperkawinan,
  });

  final String? namalengkap;
  final String? tanggallahir;
  final String? jeniskelamin;
  final String? alamatemail;
  final String? nohp;
  final String? pendidikan;
  final String? statusperkawinan;

  Biodata copyWith({
    String? namalengkap,
    String? tanggallahir,
    String? jeniskelamin,
    String? alamatemail,
    String? nohp,
    String? pendidikan,
    String? statusperkawinan,
  }) {
    return Biodata(
      namalengkap: namalengkap ?? this.namalengkap,
      tanggallahir: tanggallahir ?? this.tanggallahir,
      jeniskelamin: jeniskelamin ?? this.jeniskelamin,
      alamatemail: alamatemail ?? this.alamatemail,
      nohp: nohp ?? this.nohp,
      pendidikan: pendidikan ?? this.pendidikan,
      statusperkawinan: statusperkawinan ?? this.statusperkawinan,
    );
  }

  factory Biodata.fromJson(Map<String, dynamic> json) {
    return Biodata(
      namalengkap: json["namalengkap"],
      tanggallahir: json["tanggallahir"],
      jeniskelamin: json["jeniskelamin"],
      alamatemail: json["alamatemail"],
      nohp: json["nohp"],
      pendidikan: json["pendidikan"],
      statusperkawinan: json["statusperkawinan"],
    );
  }

  Map<String, dynamic> toJson() => {
        "namalengkap": namalengkap,
        "tanggallahir": tanggallahir,
        "jeniskelamin": jeniskelamin,
        "alamatemail": alamatemail,
        "nohp": nohp,
        "pendidikan": pendidikan,
        "statusperkawinan": statusperkawinan,
      };
}

class Informasiperusahaan {
  Informasiperusahaan({
    required this.namausaha,
    required this.alamatusaha,
    required this.jabatan,
    required this.lamabekerja,
    required this.sumberpenghasilan,
    required this.pendapatankotor,
    required this.namabank,
    required this.cabangbank,
    required this.nomorrekening,
    required this.namapemilik,
  });

  final String? namausaha;
  final String? alamatusaha;
  final String? jabatan;
  final String? lamabekerja;
  final String? sumberpenghasilan;
  final String? pendapatankotor;
  final String? namabank;
  final String? cabangbank;
  final String? nomorrekening;
  final String? namapemilik;

  Informasiperusahaan copyWith({
    String? namausaha,
    String? alamatusaha,
    String? jabatan,
    String? lamabekerja,
    String? sumberpenghasilan,
    String? pendapatankotor,
    String? namabank,
    String? cabangbank,
    String? nomorrekening,
    String? namapemilik,
  }) {
    return Informasiperusahaan(
      namausaha: namausaha ?? this.namausaha,
      alamatusaha: alamatusaha ?? this.alamatusaha,
      jabatan: jabatan ?? this.jabatan,
      lamabekerja: lamabekerja ?? this.lamabekerja,
      sumberpenghasilan: sumberpenghasilan ?? this.sumberpenghasilan,
      pendapatankotor: pendapatankotor ?? this.pendapatankotor,
      namabank: namabank ?? this.namabank,
      cabangbank: cabangbank ?? this.cabangbank,
      nomorrekening: nomorrekening ?? this.nomorrekening,
      namapemilik: namapemilik ?? this.namapemilik,
    );
  }

  factory Informasiperusahaan.fromJson(Map<String, dynamic> json) {
    return Informasiperusahaan(
      namausaha: json["namausaha"],
      alamatusaha: json["alamatusaha"],
      jabatan: json["jabatan"],
      lamabekerja: json["lamabekerja"],
      sumberpenghasilan: json["sumberpenghasilan"],
      pendapatankotor: json["pendapatankotor"],
      namabank: json["namabank"],
      cabangbank: json["cabangbank"],
      nomorrekening: json["nomorrekening"],
      namapemilik: json["namapemilik"],
    );
  }

  Map<String, dynamic> toJson() => {
        "namausaha": namausaha,
        "alamatusaha": alamatusaha,
        "jabatan": jabatan,
        "lamabekerja": lamabekerja,
        "sumberpenghasilan": sumberpenghasilan,
        "pendapatankotor": pendapatankotor,
        "namabank": namabank,
        "cabangbank": cabangbank,
        "nomorrekening": nomorrekening,
        "namapemilik": namapemilik,
      };
}

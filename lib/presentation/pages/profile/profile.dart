import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/config/routes/app_routes.dart';
import 'package:payuung_pribadi/presentation/pages/profile/component/profilecomponent.dart';
import 'package:payuung_pribadi/presentation/widget/text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const TextWidget(
          title: "Profile",
          fontSize: 16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ProfileComponent(),
            const SizedBox(
              height: 8,
            ),
            GeneralComponent(
              onTap: () => Get.toNamed(AppRoutes.profileupdate),
              icon: Icons.person,
              title: "Informasi Pribadi",
            ),
            const GeneralComponent(
              icon: Icons.description,
              title: "Syarat & Ketentuan",
            ),
            const GeneralComponent(
              icon: Icons.help,
              title: "Bantuan",
            ),
            const GeneralComponent(
              icon: Icons.privacy_tip,
              title: "Kebijakan Privasi",
            ),
            const GeneralComponent(
              icon: Icons.logout,
              title: "Log Out",
            ),
            const GeneralComponent(
              icon: Icons.delete_forever,
              title: "Hapus Akun",
            ),
            const Spacer(),
            SvgPicture.asset(
              "assets/images/payung.svg",
              width: 100,
            ),
            TextWidget(
              title: "Versi: 1.8.0",
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}

class GeneralComponent extends StatelessWidget {
  const GeneralComponent({super.key, this.onTap, this.icon, this.title});
  final Function()? onTap;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Icon(
              icon,
              color: Colors.black26,
            ),
          ),
        ),
        title: Text(title ?? ""),
      ),
    );
  }
}

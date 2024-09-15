import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:payuung_pribadi/config/const.dart';
import 'package:payuung_pribadi/data/model/menuitems.dart';
import 'package:payuung_pribadi/presentation/pages/home/component/kategoripilihan.dart';

class Produkkeuangan extends StatelessWidget {
  const Produkkeuangan({super.key});

  @override
  Widget build(BuildContext context) {
    final listItems = [
      Menuitems(
        onTap: () {},
        icon: Icons.home,
        text: "Beranda",
        color: primaryColor,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.search,
        text: "Cari",
        color: primaryColor,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.shopping_cart_outlined,
        text: "Keranjang",
        color: primaryColor,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.work_history_outlined,
        text: "Data Transaksi",
        color: primaryColor,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.discount_outlined,
        text: "Voucher Saya",
        color: primaryColor,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.location_on_outlined,
        text: "Alamat Pengiriman",
        color: primaryColor,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.people_alt_outlined,
        text: "Daftar Teman",
        color: primaryColor,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AlignedGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ActivityMenuItems(
            onTap: listItems[index].onTap,
            icon: listItems[index].icon,
            text: listItems[index].text,
            color: listItems[index].color,
          );
        },
        itemCount: listItems.length,
      ),
    );
  }
}

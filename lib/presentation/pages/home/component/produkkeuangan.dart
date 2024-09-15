import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:payuung_pribadi/data/model/menuitems.dart';
import 'package:payuung_pribadi/presentation/pages/home/component/kategoripilihan.dart';
import 'package:payuung_pribadi/presentation/widget/text.dart';

class Produkkeuangan extends StatelessWidget {
  const Produkkeuangan({super.key});

  @override
  Widget build(BuildContext context) {
    final listItems = [
      Menuitems(
        onTap: () {},
        icon: Icons.group,
        text: "Urun",
        color: Colors.lime,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.person_2,
        text: "Pembiayaan Porsi Haji",
        color: Colors.green,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.pending_actions,
        text: "Financial Check Up",
        color: Colors.yellow,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.car_crash,
        text: "Asuransi Mobil",
        color: Colors.blueGrey,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.home,
        text: "Asuransi Properti",
        color: Colors.red,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextWidget(
            title: "Produk Keuangan",
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Padding(
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
        ),
      ],
    );
  }
}

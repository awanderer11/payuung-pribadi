import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:payuung_pribadi/config/const.dart';
import 'package:payuung_pribadi/data/model/menuitems.dart';
import 'package:payuung_pribadi/presentation/widget/text.dart';

class Kategoripilihan extends StatelessWidget {
  const Kategoripilihan({super.key});

  @override
  Widget build(BuildContext context) {
    final listItems = [
      Menuitems(
        onTap: () {},
        icon: Icons.beach_access,
        text: "Hobi",
        color: Colors.blue,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.shop,
        text: "Merchandise",
        color: Colors.blue,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.monitor_heart,
        text: "Gaya Hidup Sehat",
        color: Colors.red,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.chat,
        text: "Konseling & Rohani",
        color: Colors.blue,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.self_improvement,
        text: "Self Development",
        color: Colors.purple,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.credit_card,
        text: "Perencanaan Keuangan",
        color: Colors.green,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.masks,
        text: "Konsultasi Medis",
        color: Colors.green,
      ),
      Menuitems(
        onTap: () {},
        icon: Icons.window_outlined,
        text: "Lihat Semua",
        color: Colors.blueGrey,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                title: "Kategori Pilihan",
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                  height: 35,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(radius)),
                  child: const Row(
                    children: [
                      Text("Wishlist"),
                      SizedBox(width: 4),
                      SizedBox(
                        height: 16,
                        width: 16,
                        child: CircleAvatar(
                          backgroundColor: primaryColor,
                          child: TextWidget(
                            title: "0",
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
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

class ActivityMenuItems extends StatelessWidget {
  const ActivityMenuItems({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.color,
  });
  final Function() onTap;
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            width: 80,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(icon, color: color, size: 30),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

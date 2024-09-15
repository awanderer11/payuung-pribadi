import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/config/const.dart';
import 'package:payuung_pribadi/config/utils.dart';
import 'package:payuung_pribadi/data/model/menuitems.dart';
import 'package:payuung_pribadi/presentation/widget/text.dart';

const List<String> list = <String>[
  'Terpopuler',
  'A to Z',
  'Z to A',
  'Harga Terendah',
  'Harga Tertinggi'
];

class Explorewellness extends StatefulWidget {
  const Explorewellness({super.key});

  @override
  State<Explorewellness> createState() => _ExplorewellnessState();
}

class _ExplorewellnessState extends State<Explorewellness> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    final listItems = [
      Menuitems2(
        text: "Voucher Digital Indomaret Rp25.000",
        discount: 0,
        image: "assets/images/indomaret.png",
        price: 25000,
        rate: 1,
      ),
      Menuitems2(
        text: "Voucher Digital H&M Rp100.000",
        discount: 3,
        image: "assets/images/hnm.png",
        price: 100000,
        rate: 3,
      ),
      Menuitems2(
        text: "Voucher Digital Grab Transport Rp20.000",
        discount: 0,
        image: "assets/images/grab.png",
        price: 20000,
        rate: 1,
      ),
      Menuitems2(
        text: "Voucher Digital Excelso Rp50.000",
        discount: 4,
        image: "assets/images/excelso.png",
        price: 50000,
        rate: 1,
      ),
      Menuitems2(
        text: "Voucher Digital Alfamart Rp25.000",
        discount: 0,
        image: "assets/images/alfamart.png",
        price: 25000,
        rate: 1,
      ),
      Menuitems2(
        text: "Voucher Digital Ace Hardware Rp50.000",
        discount: 0,
        image: "assets/images/ace.png",
        price: 50000,
        rate: 1,
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
                title: "Explore Wellness",
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              Container(
                height: 35,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(radius)),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: dropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: AlignedGridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ActivityMenuItems(
                text: listItems[index].text,
                discount: listItems[index].discount,
                image: listItems[index].image,
                price: listItems[index].price,
                rate: listItems[index].rate,
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
    required this.text,
    required this.price,
    required this.discount,
    required this.rate,
    required this.image,
  });
  final String text;
  final double price;
  final int discount;
  final int rate;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            width: Get.width / 3,
            height: Get.width / 1.8,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(image),
                  const SizedBox(height: 10),
                  Text(
                    text,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Builder(
                    builder: (context) {
                      if (discount == 0) {
                        return Text(
                          Utils().toRp(price),
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontSize: 12),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                Utils().toRp(price),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                " $discount%OFF",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.red),
                              ),
                            ],
                          ),
                          Text(
                            Utils().toRp(price - (price / 100) * discount),
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      );
                    },
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

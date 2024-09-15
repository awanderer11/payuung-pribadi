import 'package:flutter/widgets.dart';

class Menuitems {
  Menuitems({
    required this.color,
    required this.onTap,
    required this.text,
    required this.icon,
  });
  final Function() onTap;
  final IconData icon;
  final String text;
  final Color color;
}

class Menuitems2 {
  Menuitems2({
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
}

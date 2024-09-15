import 'package:flutter/material.dart';
import 'package:payuung_pribadi/config/const.dart';

class FrameWidget extends StatelessWidget {
  const FrameWidget(
      {super.key,
      required this.widget,
      this.bottom,
      this.left,
      this.right,
      this.top});

  final Widget widget;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Container(color: primaryColor),
        ),
        Positioned(
          top: top ?? 0,
          bottom: bottom ?? 0,
          right: right ?? 0,
          left: left ?? 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius),
                  topLeft: Radius.circular(radius)),
              color: Colors.white,
            ),
            child: widget,
          ),
        ),
      ],
    );
  }
}

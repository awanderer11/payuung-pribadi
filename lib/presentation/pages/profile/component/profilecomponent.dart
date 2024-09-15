import 'package:flutter/material.dart';
import 'package:payuung_pribadi/config/utils.dart';
import 'package:payuung_pribadi/presentation/widget/text.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: TextWidget(
                  title: Utils().getInitial("Alif"),
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 12,
                child: const Icon(
                  Icons.camera_alt,
                  size: 16,
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 8),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              title: "Alif kurniawan",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            TextWidget(
              title: "Masuk dengan Google",
              fontSize: 16,
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payuung_pribadi/presentation/pages/home/component/explorewellness.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cari Kebutuhanmu"),
      ),
      body: const SingleChildScrollView(child: Explorewellness()),
    );
  }
}

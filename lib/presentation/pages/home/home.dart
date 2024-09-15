import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/config/const.dart';
import 'package:payuung_pribadi/config/routes/app_routes.dart';
import 'package:payuung_pribadi/config/utils.dart';
import 'package:payuung_pribadi/presentation/pages/home/component/explorewellness.dart';
import 'package:payuung_pribadi/presentation/pages/home/component/kategoripilihan.dart';
import 'package:payuung_pribadi/presentation/pages/home/component/produkkeuangan.dart';
import 'package:payuung_pribadi/presentation/widget/frame.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Utils().greeting(),
              style: const TextStyle(fontSize: 16),
            ),
            const Text(
              "Alif",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Badge(
              label: Text("0"),
              textStyle: TextStyle(fontSize: 8),
              child: Icon(
                Icons.notifications_none_sharp,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.profile),
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Text(Utils().getInitial("Alif")),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: FrameWidget(
              widget: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    padding: const EdgeInsets.all(5),
                    clipBehavior: Clip.hardEdge,
                    height: 45,
                    decoration: BoxDecoration(
                      color: backGroundColor,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black12,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: Get.theme.primaryColor,
                      ),
                      controller: _tabController,
                      onTap: (value) => setState(
                        () {
                          selected = value;
                        },
                      ),
                      tabs: const [
                        Tab(text: 'Payuung Pribadi'),
                        Tab(text: 'Payuung Karyawan'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        PayuungPribadiTab(),
                        PayuungKaryawanTab(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PayuungPribadiTab extends StatelessWidget {
  const PayuungPribadiTab({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      const Produkkeuangan(),
      const Kategoripilihan(),
      const Explorewellness()
    ];
    return ListView.builder(
      itemCount: list.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => list[index],
    );
  }
}

class PayuungKaryawanTab extends StatelessWidget {
  const PayuungKaryawanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Payuung Karyawan"),
    );
  }
}

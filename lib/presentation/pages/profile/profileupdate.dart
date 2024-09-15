import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_stepper_flutter/horizontal_stepper_flutter.dart';
import 'package:payuung_pribadi/config/const.dart';
import 'package:payuung_pribadi/presentation/controller/user.dart';
import 'package:payuung_pribadi/presentation/pages/profile/component/form.dart';
import 'package:payuung_pribadi/presentation/widget/text.dart';

class ProfileupdatePage extends StatefulWidget {
  const ProfileupdatePage({super.key});

  @override
  State<ProfileupdatePage> createState() => _ProfileupdatePageState();
}

class _ProfileupdatePageState extends State<ProfileupdatePage>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int cPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          title: "Informasi Pribadi",
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlutterHorizontalStepper(
              steps: const [
                "Biodata Diri",
                "Alamat Pribadi",
                "Informasi Perusahaan"
              ],
              thickness: 2,
              radius: 50,
              onClick: (p0) => _updateCurrentPageIndex(p0),
              currentStep: cPageIndex + 1,
              completeStepColor: primaryColor,
              currentStepColor: primaryColor,
              inActiveStepColor: Colors.grey.shade300,
              titleStyle: const TextStyle(color: primaryColor),
              child: [
                const TextWidget(
                  title: "1",
                  color: Colors.white,
                ),
                const TextWidget(
                  title: "2",
                  color: Colors.white,
                ),
                InkWell(
                  onTap: () => _updateCurrentPageIndex(2),
                  child: const TextWidget(
                    title: "3",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageViewController,
              onPageChanged: (value) => _handlePageViewChanged(value),
              children: [
                Biodata(
                  tabController: _tabController,
                  currentPageIndex: cPageIndex,
                  onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                ),
                AlamatPribadi(
                  tabController: _tabController,
                  currentPageIndex: cPageIndex,
                  onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                ),
                InformasiPerusahaan(
                  tabController: _tabController,
                  currentPageIndex: cPageIndex,
                  onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(
      () {
        cPageIndex = currentPageIndex;
      },
    );
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    setState(() {
      _pageViewController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    final last = tabController.length - 1;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        currentPageIndex == 0
            ? const SizedBox()
            : Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: () {
                    if (currentPageIndex == 0) {
                      return;
                    }
                    onUpdateCurrentPageIndex(currentPageIndex - 1);
                  },
                  child: const Text("Sebelumnya"),
                ),
              ),
        const SizedBox(width: 8),
        GetBuilder<UserController>(
          builder: (controller) {
            if (currentPageIndex == last) {
              return Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.save();
                    if (currentPageIndex == last) {
                      return;
                    }
                    onUpdateCurrentPageIndex(currentPageIndex + 1);
                  },
                  child: const Text("Simpan"),
                ),
              );
            } else {
              return Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (currentPageIndex == last) {
                      return;
                    }
                    onUpdateCurrentPageIndex(currentPageIndex + 1);
                  },
                  child: const Text("Selanjutnya"),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payuung_pribadi/config/const.dart';
import 'package:payuung_pribadi/presentation/pages/home/home.dart';
import 'package:payuung_pribadi/presentation/pages/search.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  int selected = 0;
  static double minHeight = 100, maxHeight = 300;
  Offset _offset = Offset(0, minHeight);
  bool _isOpen = false;
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[MyHomePage(), SearchPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              _offset = Offset(0, _offset.dy - details.delta.dy);
              if (_offset.dy < minHeight) {
                _offset = Offset(0, minHeight);
                _isOpen = false;
              } else if (_offset.dy > maxHeight) {
                _offset = Offset(0, maxHeight);
                _isOpen = true;
              }
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration.zero,
              curve: Curves.easeOut,
              height: _offset.dy,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                  )
                ],
              ),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SwipeButton(
                      isOpen: _isOpen,
                      onTap: _handleClick,
                    ),
                    BottomNavigationBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Beranda',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.search),
                          label: 'Cari',
                        ),
                        BottomNavigationBarItem(
                          icon: Stack(
                            children: <Widget>[
                              Badge(
                                  label: Text("0"),
                                  textStyle: TextStyle(fontSize: 8),
                                  child: Icon(Icons.shopping_cart_outlined)),
                            ],
                          ),
                          label: 'Keranjang',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      selectedItemColor: primaryColor,
                      onTap: _onItemTapped,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonItems(
                          onTap: () {},
                          icon: Icons.work_history_outlined,
                          text: "Data Transaksi",
                        ),
                        ButtonItems(
                          onTap: () {},
                          icon: Icons.discount_outlined,
                          text: "Voucher Saya",
                        ),
                        ButtonItems(
                          onTap: () {},
                          icon: Icons.location_on_outlined,
                          text: "Alamat Pengiriman",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonItems(
                          onTap: () {},
                          icon: Icons.people_alt_outlined,
                          text: "Daftar Teman",
                        ),
                        const ButtonItems(),
                        const ButtonItems(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      return;
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _handleClick() {
    _isOpen = !_isOpen;
    Timer.periodic(const Duration(milliseconds: 5), (timer) {
      if (_isOpen) {
        double value = _offset.dy + 10;
        _offset = Offset(0, value);
        if (_offset.dy > maxHeight) {
          _offset = Offset(0, maxHeight);
          timer.cancel();
        }
      } else {
        double value = _offset.dy - 10;
        _offset = Offset(0, value);
        if (_offset.dy < minHeight) {
          _offset = Offset(0, minHeight);
          timer.cancel();
        }
      }
      setState(() {});
    });
  }
}

class SwipeButton extends StatelessWidget {
  const SwipeButton({super.key, required this.isOpen, this.onTap});
  final void Function()? onTap;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        isOpen ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up_outlined,
        color: Colors.blueGrey,
        size: 40,
      ),
    );
  }
}

class ButtonItems extends StatelessWidget {
  const ButtonItems({
    super.key,
    this.onTap,
    this.icon,
    this.text,
  });

  final Function()? onTap;
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              Icon(icon, color: Colors.grey[400], size: 25),
              Text(
                text ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

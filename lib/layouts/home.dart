import 'package:Tasbih/home/tabs/ahadeth_tab.dart';
import 'package:Tasbih/home/tabs/quran_tab.dart';
import 'package:Tasbih/home/tabs/radio_tab.dart';
import 'package:Tasbih/home/tabs/sebha_tab.dart';
import 'package:Tasbih/home/tabs/settings_tab.dart';
import 'package:Tasbih/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Stack(
      children: [
        Image.asset(
          provider.getBG(),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              "إسلامي",
              style: GoogleFonts.elMessiri(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            iconSize: 26.sp,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_quran.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_ahadeth.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_sebha.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_radio.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "",
              ),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];
}

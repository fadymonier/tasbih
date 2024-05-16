import 'package:Tasbih/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    bool switchValue = provider.myTheme == ThemeMode.dark;

    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                activeColor: const Color(0xffB7935F),
                focusColor: const Color(0xffB7935F),
                hoverColor: const Color(0xffB7935F),
                activeTrackColor: Colors.black26,
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: Colors.transparent,
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                  provider
                      .changeAppTheme(value ? ThemeMode.dark : ThemeMode.light);
                },
              ),
              Text(
                "الوضع الداكن",
                style: GoogleFonts.elMessiri(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

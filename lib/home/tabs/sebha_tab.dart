import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int currentIndex = 0;
  double angle = 0;
  List<String> tasbih = ["سبحان الله", "الحمد لله", "لا اله الا الله"];

  void tasbihCounter() {
    setState(() {
      angle += 30;
      counter++;
      if (counter % 33 == 0) {
        counter = 0;
        currentIndex = (currentIndex + 1) % tasbih.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/head_sebha_logo.png",
                    height: 65.h,
                  ),
                ),
                GestureDetector(
                  onTap: tasbihCounter,
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset("assets/images/body_sebha_logo.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            "عدد التسبيحات",
            style: GoogleFonts.elMessiri(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            width: 80.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: const Color(0xffB7935F),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Text(
                "$counter",
                style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: const Color(0xffB7935F),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Text(
                tasbih[currentIndex],
                style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.h,
          )
        ],
      ),
    );
  }
}

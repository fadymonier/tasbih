// ignore_for_file: empty_catches

import 'package:Tasbih/layouts/hadith_details.dart';
import 'package:Tasbih/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadithModel> allAhadith = [];

  @override
  void initState() {
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/ahadith.png",
            height: 160.h,
          ),
        ),
        const Divider(
          thickness: 3,
          color: Color(0xFFB7935F),
        ),
        Text(
          "الأحاديث",
          textAlign: TextAlign.center,
          style:
              GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Divider(
          thickness: 3,
          color: Color(0xFFB7935F),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: const Color(0xFFB7935F),
              endIndent: 0.w,
              indent: 0.w,
            ),
            itemCount: allAhadith.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadithDetails.routeName,
                      arguments: allAhadith[index]);
                },
                child: Text(
                  allAhadith[index].title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.elMessiri(
                      fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Future<void> loadHadithFile() async {
    try {
      String hadithFile =
          await rootBundle.loadString("assets/files/ahadeth.txt");

      List<String> ahadith = hadithFile.split("#");

      for (int i = 0; i < ahadith.length; i++) {
        String hadith1 = ahadith[i];
        List<String> hadithLines = hadith1.trim().split("\n");

        String title = hadithLines[0];
        hadithLines.removeAt(0);
        List<String> content = hadithLines;

        HadithModel hadithModel = HadithModel(title, content);
        allAhadith.add(hadithModel);
      }
      setState(() {});
    } catch (e) {}
  }
}

import 'package:Tasbih/provider/my_provider.dart';
import 'package:Tasbih/models/sura_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    var suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;

    if (verses.isEmpty) {
      readSuraFile(suraModel.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getBG()), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            suraModel.name,
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: verses.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: Color(0xffB7935F),
              ))
            : Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                    endIndent: 5.w,
                    indent: 5.w,
                    color: const Color(0xffB7935F),
                  ),
                  itemBuilder: (context, index) {
                    return Text(
                      "${verses[index]} (${index + 1})",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.elMessiri(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          letterSpacing: 1),
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      ),
    );
  }

  void readSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");

    List<String> suraLines = sura.split("\n");
    verses = suraLines;
    setState(() {});
  }
}

import 'package:Tasbih/models/hadith_model.dart';
import 'package:Tasbih/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName = "HadithDetails";
  const HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as HadithModel;
    var provider = Provider.of<MyProvider>(context);

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
            model.title,
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
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
                "${model.content[index]} ",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.elMessiri(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    letterSpacing: 1),
              );
            },
            itemCount: model.content.length,
          ),
        ),
      ),
    );
  }
}

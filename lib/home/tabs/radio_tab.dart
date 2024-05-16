import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:Tasbih/provider/my_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MyProvider()..getRadioData(),
      child: Consumer<MyProvider>(
        builder: (BuildContext context, MyProvider myProvider, child) {
          if (myProvider.data.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xffB7935F),
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),
                Image.asset(
                  "assets/images/radio_image.png",
                  filterQuality: FilterQuality.high,
                  width: 350.w,
                ),
                Text(
                  "إذاعة القرآن الكريم",
                  style: GoogleFonts.elMessiri(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    physics: const PageScrollPhysics(),
                    itemCount: myProvider.data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            myProvider.data[index].name ?? "",
                            style: GoogleFonts.elMessiri(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  myProvider.pauseAudio();
                                },
                                child: Icon(
                                  Icons.pause,
                                  size: 40.sp,
                                  color: const Color(0xffB7935F),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0.r),
                                child: InkWell(
                                  onTap: () {
                                    myProvider.playAudio(index);
                                  },
                                  child: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 55.sp,
                                    color: const Color(0xffB7935F),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  myProvider.stopAudio();
                                },
                                child: Icon(
                                  Icons.stop,
                                  size: 40.sp,
                                  color: const Color(0xffB7935F),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

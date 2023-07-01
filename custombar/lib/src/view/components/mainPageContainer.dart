import 'package:custombar/src/view/components/mainScreenButton.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainPageContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String buttonText;
  final Color colors;
  final Color textColors;
  final Color borderColor;
  final Color buttonColor;
  var onTap;
  MainPageContainer(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.buttonText,
      required this.colors,
      required this.textColors,
      required this.borderColor,
      required this.buttonColor,
      this.onTap
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: 100.w,
        height:50.h,
        // height: 50.h,
        color: colors,
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Text(
              text1,
              style: TextStyle(fontSize: 15.sp, color: textColors),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Text(
              text2,
              style: TextStyle(fontSize: 15.sp, color: textColors),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Text(
              text3,
              style: TextStyle(fontSize: 15.sp, color: textColors),
            ),
            SizedBox(height: 2.h),
            InkWell(
                onTap: onTap,
                child: MainScreenButton(
                    buttonText: buttonText,
                    borderColor: borderColor,
                    buttonColor: buttonColor))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreenButton extends StatelessWidget {
 final String buttonText;
 final Color borderColor;
 final Color buttonColor;

   MainScreenButton({Key? key, required this.buttonText, required this.borderColor, required this.buttonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: buttonColor,
          border:Border.all(
              color: borderColor,
              width: 5
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(buttonText,style: TextStyle(fontSize: 15.sp,color: Colors.white),)),
      ),
    );
  }
}

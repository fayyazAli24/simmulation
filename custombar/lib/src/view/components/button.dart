import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonOptionButton extends StatelessWidget {
  String buttonName;
   CommonOptionButton({Key? key ,required this.buttonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 10.h,

      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          width: 5,
          color: Colors.white
        )
      ),
      child: Center(child: Text(buttonName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp,color: Colors.white),)),
    );
  }
}

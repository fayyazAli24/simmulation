import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StatsResult extends StatelessWidget {
  final String parameter;
  final double time;
  var color;
   StatsResult({Key? key, required this.parameter, required this.time,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(parameter,style: TextStyle(fontSize: 12.sp,color: Colors.grey),),
        SizedBox(height: 1.4.h,),
        Row(
          children: [
            Text(time.toString(),style: TextStyle(color: color,fontSize: 20.sp),),
            SizedBox(width: 1.w,),
            Text("minutes",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
          ],
        ),
        Container(
          width: 10.w,
          height: 1.5.h,
          color: color,
        )
      ],
    );
  }
}

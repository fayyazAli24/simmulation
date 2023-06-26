import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphName extends StatelessWidget {
 final  String graphName;
   GraphName({Key? key, required this.graphName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          width: 14.w,
          height: 10.h,
          decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.blue)),
          child: Center(
            child: Text(graphName,
                style: TextStyle(
                    fontSize: 15.sp, color: Colors.teal)),
          )),
    );
  }
}

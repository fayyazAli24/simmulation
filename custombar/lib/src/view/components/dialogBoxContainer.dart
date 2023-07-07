import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'customInputField.dart';
import 'dialogButton.dart';

class DialogBoxContainer extends StatelessWidget {
  var tap;
  var controller1;
  var controller2;
  var controller3;
  DialogBoxContainer(
      {Key? key,
      required this.tap,
      required this.controller1,
      required this.controller2,
      required this.controller3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40.w,
        height: 55.h,
        child: Column(children: [
          const Text(
            "Enter value of arrival mean",
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(
            height: 1.h,
          ),
          CustomInputField(
            controller: controller1,
          ),
          SizedBox(
            height: 1.h,
          ),
          const Text("Enter value of service mean",
              style: TextStyle(color: Colors.blue)),
          SizedBox(
            height: 1.h,
          ),
          CustomInputField(controller: controller2),
          SizedBox(
            height: 1.h,
          ),
          Text("Enter the number of server",
              style: TextStyle(color: Colors.blue)),
          SizedBox(
            height: 1.h,
          ),
          CustomInputField(controller: controller3),
          SizedBox(height: 2.h),
          InkWell(onTap: tap, child: DialogBoxButton())
        ]));
  }
}

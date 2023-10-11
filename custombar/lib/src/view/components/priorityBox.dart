import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'customInputField.dart';
import 'dialogButton.dart';

class PriorityBox extends StatelessWidget {
  var tap;
  var controllerArrival;
  var controllerService;
  var controllerServers;
  var controllerCustomers;
  var controllerA;
  var controllerZ;
  var controllerM;
  var controllera;
  var controllerb;
  var controllerc;
  var isPriority;

  PriorityBox(
      {Key? key,
        required this.tap,
        required this.controllerArrival,
        required this.controllerService,
        required this.controllerServers,
        required this.controllerCustomers,
        required this.controllerA,
        required this.controllerZ,
        required this.controllerM,
        required this.controllera,
        required this.controllerb,
        required this.controllerc,
        this.isPriority = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: Container(
          width: 40.w,
          height: 80.h,
          child:
          SingleChildScrollView(
            child: Column(
                children: [
              const Text(
                "Enter value of arrival mean",
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(
                controller: controllerArrival,
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text("Enter value of service mean",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(controller: controllerService),
              SizedBox(
                height: 1.h,
              ),
              Text("Enter the number of server",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(controller: controllerServers),

              Text("Enter the number of customers",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(controller: controllerCustomers),

              SizedBox(height: 2.h),
              Text("Enter the number of A",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(controller: controllerA),

              SizedBox(height: 2.h), Text("Enter the number of M",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(controller: controllerM),

              SizedBox(height: 2.h), Text("Enter the number of Z",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(controller: controllerZ),

              SizedBox(height: 2.h), Text("Enter the number of c",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(controller: controllerc),

              SizedBox(height: 2.h), Text("Enter the number of b",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(controller: controllerb),
              SizedBox(height: 2.h), Text("Enter the number of a",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 1.h,
              ),
              CustomInputField(controller: controllera),

              SizedBox(height: 2.h),
              InkWell(onTap: tap, child: DialogBoxButton())
            ]),
          )),
    );
  }
}

import 'package:custombar/src/controller/gantChartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../components/customLineChartDataScreen.dart';
import '../components/dataScreenBarGraph.dart';

class DataResultScreen extends StatelessWidget {
  const DataResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChartController controller = Get.put(ChartController());
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 2.h,),
          Text("Graphical illustration of Excel data(Exponential)",
            style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Probablity of classes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.blue),),
                  SizedBox(height: 1.h,),
                  Container(
                    width: 33.w,
                    height: 60.h,
                    child:PieChart(
                        chartRadius: 200,
                        dataMap: controller.dataMap,
                        legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.right),
                        chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: false,
                        showChartValues: false),
                  )),
                ],
              ),
              Column(
                children: [
                   Text("Expected frequency of classes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.blue),),
                  SizedBox(height:1.h),
                  Container(
                    width: 40.w,
                    height: 60.h,
                    child: CustomLineChartDataScreen(list1: controller.lineChartData,),
                  ),
                ],
              ),

              SizedBox(height: 1.5.h,),

            ],
          ),
          SizedBox(height: 3.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Frequency of each class in Bars",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.blue),),
                  SizedBox(height:3.h),
                  Container(
                    width: 33.w,
                    height: 60.h,
                    child:DataScreenBarGraph(
                      max: 50,
                      data:controller.barData,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Chi-Square of each class in Bars",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.blue),),
                  SizedBox(height:3.h),
                  Container(
                    width: 33.w,
                    height: 60.h,
                    child:DataScreenBarGraph(
                      max: 5,
                      data:controller.barData2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6.h,),
          Text("Calculated CHI-SQUARE value is 9.4318",style: TextStyle(color: Color(0xff000C66),fontSize: 16.sp),),
          SizedBox(height: 1.h,),

          Text("Tabulated CHI-SQUARE value is 9.488",style: TextStyle(color: Color(0xff000C66),fontSize: 16.sp)),
          SizedBox(height: 1.h,),

          Text("We accept Null Hypothesis",style: TextStyle(color: Color(0xff000C66),fontSize: 16.sp)),
          SizedBox(height: 6.h,),


          // exponential

          Text("Graphical illustration of Excel data(Poisson)",
            style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Probablity of classes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.blue),),
                  SizedBox(height: 1.h,),
                  Container(
                      width: 33.w,
                      height: 60.h,
                      child:PieChart(
                        chartRadius: 200,
                        dataMap: controller.dataMapPoisson,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.right),
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: false,
                            showChartValues: false),
                      )),
                ],
              ),
              Column(
                children: [
                  Text("Expected frequency of classes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.blue),),
                  SizedBox(height:1.h),
                  Container(
                    width: 40.w,
                    height: 60.h,
                    child: CustomLineChartDataScreen(list1: controller.lineChartDataPoisson,max: 150,),
                  ),
                ],
              ),

              SizedBox(height: 1.5.h,),

            ],
          ),
          SizedBox(height: 3.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Frequency of each class in Bars",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.blue),),
                  SizedBox(height:3.h),
                  Container(
                    width: 33.w,
                    height: 60.h,
                    child:DataScreenBarGraph(
                      max: 50,
                      data:controller.barDataPoisson,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Chi-Square of each class in Bars",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.blue),),
                  SizedBox(height:3.h),
                  Container(
                    width: 33.w,
                    height: 60.h,
                    child:DataScreenBarGraph(
                      max: 5,
                      data:controller.barDataPoisson,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6.h,),
          Text("Calculated CHI-SQUARE value is 2.607854",style: TextStyle(color: Color(0xff000C66),fontSize: 16.sp),),
          SizedBox(height: 1.h,),

          Text("Tabulated CHI-SQUARE value is 9.488",style: TextStyle(color: Color(0xff000C66),fontSize: 16.sp)),
          SizedBox(height: 1.h,),

          Text("We accept Null Hypothesis",style: TextStyle(color: Color(0xff000C66),fontSize: 16.sp)),
          SizedBox(height: 6.h,),




        ],
      ),
    );
  }
}

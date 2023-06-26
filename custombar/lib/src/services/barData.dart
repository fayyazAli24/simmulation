import 'package:custombar/src/services/individualBar.dart';

class BarData{
  final double TAT;
  final double ST;
  final double WT;
  final double RT;
  final double ET;

  BarData({required this.ST, required this.ET, required this.TAT, required this.WT, required this.RT});


  List <IndividualBar> barData=[];

  void initializeBarData(){
    barData = [
      IndividualBar(x: 0, y: ST),
      IndividualBar(x: 1, y: ET),
      IndividualBar(x: 2, y: TAT),
      IndividualBar(x: 3, y: WT),
      IndividualBar(x: 4, y: RT),


    ];
  }
}
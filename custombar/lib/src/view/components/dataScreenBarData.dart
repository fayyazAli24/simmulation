import 'package:custombar/src/services/individualBar.dart';

class dataScreenBarData{
  final double first ;
  final double second ;
  final double third;
  final double fourth;
  final double fifth;
  final double sixth;
  dataScreenBarData({
    required this.first, required this.second, required this.third, required this.fourth, required this.fifth,
    required this.sixth,

  });


  List <IndividualBar> barData=[];

  void initializeBarData(){
    barData = [
      IndividualBar(x: 1, y: first),
      IndividualBar(x: 2, y: second),
      IndividualBar(x: 3, y: third),
      IndividualBar(x: 4, y: fourth),
      IndividualBar(x: 5, y: fifth),
      IndividualBar(x: 6, y: sixth),



    ];
  }
}
import 'package:custombar/src/services/individualBar.dart';

class BarData{
  final double first ;
  final double second ;
  final double third;
  final double fourth;
  final double fifth;
  final double sixth;
  final double seventh;
  final double eight ;
  final double nineth ;
  final double tenth;


  BarData({
    required this.first, required this.second, required this.third, required this.fourth, required this.fifth,
    required this.sixth, required this.seventh, required this.eight, required this.nineth, required this.tenth,

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
      IndividualBar(x: 7, y: seventh),
      IndividualBar(x: 8, y:eight),
      IndividualBar(x: 9, y: nineth),
      IndividualBar(x: 10, y: tenth),


    ];
  }
}
import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculateBrain{
  CalculateBrain(@required this.weight,@required this.height,@required this.age);
  final int height,age,weight;
  double _bmi;
  String getBMI(){
    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
}
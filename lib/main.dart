import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emi_calculator/pages/emi_print.dart';
import 'package:emi_calculator/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home':(content)=> EMI_Calculator(),
    '/emi_print':(Content)=> EMI_Print(),
  },
));


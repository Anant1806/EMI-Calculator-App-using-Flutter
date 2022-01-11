
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:emi_calculator/pages/home.dart';

class EMI_Print extends StatefulWidget{
  @override
  _EMI_Print createState() => _EMI_Print ();
}

class _EMI_Print  extends State<EMI_Print>{
  @override
  Widget build(BuildContext context) {

    final String EMI=ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("EMI"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow
          ),
          child: Text("$EMI",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.deepOrange,
    );
  }
}
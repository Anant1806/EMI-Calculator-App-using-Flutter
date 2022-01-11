import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emi_calculator/pages/emi_print.dart';

class EMI_Calculator extends StatefulWidget{
  @override
  _EMI_Calculator createState() => _EMI_Calculator ();
}

class _EMI_Calculator extends State<EMI_Calculator>{

  TextEditingController principle= new TextEditingController();
  TextEditingController time= new TextEditingController();
  TextEditingController rate= new TextEditingController();

  int princ=0;
  int pa=0;
  int dura=0;
  double val=0;
  String err="";
  String output="";

  double CalcSimple(){
    double interest,emi;
    setState(() {
      princ=int.parse(principle.text);
      dura=int.parse(time.text);
      pa=int.parse(rate.text);
    });
    if(princ==null || dura==0 || pa==0){
      setState(() {
        err="Please Fill all the Fields to Calculate the EMI";
      });
    }
    else{
      setState(() {
        err="";
      });
      interest = (princ*pa*dura)/100;
      emi=(princ+interest)/(12*dura);
    }
    return emi;
  }

  double CalcCompound(){
    setState(() {
      princ=int.parse(principle.text);
      dura=int.parse(time.text);
      pa=int.parse(rate.text);
    });
    double interest,emi,amm=1;
    err="";
    if(princ==null || dura==null || pa==null){
      setState(() {
        err="Please Fill all the Fields to Calculate the EMI";
      });
    }
    else{
      setState(() {
        err="";
      });
      for(int i=0;i<dura;i++){
        amm= amm*(1+(pa/100));
      }
      interest = (princ*amm);
      emi=(princ+interest)/(12*dura);
    }
    return emi;
  }

  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Input(
              hint: "Principle in Rupees",
              control: principle,
            ),
            Input(
              hint: "Duration in Years",
              control: time,
            ),
            Input(
              hint: "Rate in %",
              control: rate,
            ),
            Row(
              children: [
                Expanded(
                  flex:1,
                  child: Container(

                    color: Colors.deepOrange,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      child:Text("Simple Interest"),
                      onPressed: (){
                        val = CalcSimple();
                        setState(() {
                          output="Rs "+"$val"+" is your monthly EMI";
                        });
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => EMI_Print(),
                          settings: RouteSettings(
                            arguments: output,
                          )
                        ));
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    color: Colors.deepOrange,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      child:Text("Compound Interest"),
                      onPressed:(){
                        val = CalcCompound();
                        setState(() {
                          output="Rs "+"$val"+" is your monthly EMI";
                        });
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => EMI_Print(),
                            settings: RouteSettings(
                              arguments: output,
                            )
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.deepOrange,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text(
                "$err",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.deepOrange,
    );
  }
}


class Input extends StatelessWidget{
  Input({this.hint,this.control});
  TextEditingController control;
  String hint;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(10),
      ),
      child:TextField(
        controller: control,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "$hint",
          contentPadding: EdgeInsets.all(5),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }

}
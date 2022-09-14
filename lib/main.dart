import 'package:flutter/material.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
      );
  }
}
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  Widget calcbutton(String btnText,Color btncolor, Color txtcolor){
    return Container(
        child: ElevatedButton(
          onPressed: (){
           calculate(btnText);
          },
        child: Text(btnText,
            style: TextStyle(
              fontSize: 35,
              color: txtcolor,
            ),
        ),
            style: ElevatedButton.styleFrom(
              primary: btncolor,
              fixedSize: Size(70,70),
              shape: CircleBorder(),
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            ),
                ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Calculator'),backgroundColor: Colors.black),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Padding(padding: EdgeInsets.all(10.0),
                    child: Text(
                      text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100,
                    ),
                    )
                  )
                ],
              ),
            SizedBox(height: 10,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcbutton('AC', Colors.grey, Colors.black),
                    calcbutton('+/-', Colors.grey, Colors.black),
                    calcbutton('%', Colors.grey, Colors.black),
                    calcbutton('/', Colors.amber, Colors.white),
                  ],
                ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7', Colors.grey, Colors.black),
                calcbutton('8', Colors.grey, Colors.black),
                calcbutton('9', Colors.grey, Colors.black),
                calcbutton('x', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Colors.grey, Colors.black),
                calcbutton('5', Colors.grey, Colors.black),
                calcbutton('6', Colors.grey, Colors.black),
                calcbutton('-', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('1', Colors.grey, Colors.black),
                calcbutton('2', Colors.grey, Colors.black),
                calcbutton('3', Colors.grey, Colors.black),
                calcbutton('+', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 35,color: Colors.black),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.grey
                  ),
                  ),
                calcbutton('.', Colors.grey, Colors.black),
                calcbutton('=', Colors.amber, Colors.white),
              ],
            ),
          ],
        ),
      )
    );
  }
  int firstNumber=0;
  int secondNumber=0;
  String result="";
  String text=" ";
  String operation="";

  void calculate(String btnText)
  {
    if(btnText=="AC") {
      result = "";
      text = "";
      firstNumber = 0;
      secondNumber = 0;
    }
    else if(btnText=="+" || btnText=="-" || btnText == "x" || btnText=="/") {
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
    }
    else if(btnText == "=") {
      secondNumber=int.parse(text);
      if(operation=="+") {
        result = (firstNumber + secondNumber).toString();
      }
      if(operation=="-") {
        result = (firstNumber - secondNumber).toString();
      }
      if(operation=="x") {
        result = (firstNumber * secondNumber).toString();
      }
      if(operation=="/") {
        result = (firstNumber / secondNumber).toString();
      }
    }
    else{
      result=int.parse(text+btnText).toString();
    }
    setState(() {
      text=result;
    });
  }
}



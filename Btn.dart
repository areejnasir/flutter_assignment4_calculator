import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

String firstvalue = "0";
String operat = " ";
String secondvalue = "0";
String result = firstvalue + operat + secondvalue;

class Btn extends StatefulWidget {
  @override
  _BtnState createState() => _BtnState();
}

class _BtnState extends State<Btn> {
  btnPressed(String name) {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    num eval = exp.evaluate(EvaluationType.REAL, cm);
    if (name == "C") {
      setState(() {
        firstvalue = "0";
        secondvalue = "0";
        operat = " ";
        result = "0";
      });
    } else if (name == "⌦") {
      // firstvalue = firstvalue.substring(0, firstvalue.length - 1);
      // secondvalue = secondvalue.substring(0, secondvalue.length - 1);
      // result = result.substring(0, result.length - 1);
      if (secondvalue == "0") {
        setState(() {
          firstvalue = firstvalue.substring(0, firstvalue.length - 1);
        });
      } else if (firstvalue == "0") {
        setState(() {
          secondvalue = secondvalue.substring(0, secondvalue.length - 1);
        });
      } else {
        result = result.substring(0, result.length - 1);
      }
    } else if (name == "+") {
      setState(() {
        operat = "+";
        result = firstvalue + operat + secondvalue;
      });
    } else if (name == "-") {
      setState(() {
        operat = "-";
        result = firstvalue + operat + secondvalue;
      });
    } else if (name == "×") {
      setState(() {
        operat = "*";
        result = firstvalue + operat + secondvalue;
      });
    } else if (name == "÷") {
      setState(() {
        operat = "/";
        result = firstvalue + operat + secondvalue;
      });
    } else if (name == "%") {
      setState(() {
        operat = "%";
        result = firstvalue + operat + secondvalue;
      });
    } else if (name == "=") {
      setState(() {
        result = firstvalue + operat + secondvalue;
        result = eval.toString();
      });
    } else if (operat != " ") {
      setState(() {
        secondvalue += name;
        result = firstvalue + operat + secondvalue;
      });
    } else {
      setState(() {
        // firstvalue = name;
        firstvalue += name;
        result = firstvalue + operat + secondvalue;
      });
    }

    // setState(() {
    //   // if(name == "")
    //   // result = firstvalue + operat + secondvalue;
    //   result = eval.toString();
    // });
  }

  @override
  Widget build(BuildContext context) {
    Widget btn(name, Color clr, double hit) {
      return Container(
          color: clr,
          height: hit,
          child: TextButton(
            child: Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () => btnPressed(name),
          ));
    }

    return Column(
      children: [
        Container(
          color: Colors.black54,
          // margin: EdgeInsets.only(top: 60),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  firstvalue,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 15, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  operat,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 15, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  secondvalue,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.only(top: 15, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  result,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Row(children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Table(
                children: [
                  TableRow(children: [
                    btn("C", Colors.black38, 70),
                    btn("÷", Colors.black38, 70),
                    btn("×", Colors.black38, 70),
                  ]),
                  TableRow(children: [
                    btn("7", Colors.black38, 50),
                    btn("8", Colors.black38, 50),
                    btn("9", Colors.black38, 50),
                  ]),
                  TableRow(children: [
                    btn("4", Colors.black38, 50),
                    btn("5", Colors.black38, 50),
                    btn("6", Colors.black38, 50),
                  ]),
                  TableRow(children: [
                    btn("1", Colors.black38, 50),
                    btn("2", Colors.black38, 50),
                    btn("3", Colors.black38, 50),
                  ]),
                  TableRow(children: [
                    btn("%", Colors.black38, 70),
                    btn("0", Colors.black38, 70),
                    btn(".", Colors.black38, 70),
                  ]),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Table(
                children: [
                  TableRow(children: [
                    btn("⌦", Colors.black38, 70),
                  ]),
                  TableRow(children: [
                    btn("-", Colors.black38, 50),
                  ]),
                  TableRow(children: [
                    btn("+", Colors.black38, 50),
                  ]),
                  TableRow(children: [
                    btn("=", Colors.indigo, 120),
                  ]),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}

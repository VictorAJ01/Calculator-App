import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCalculatorAppHome(),
    );
  }
}

class MyCalculatorAppHome extends StatefulWidget {
  const MyCalculatorAppHome({super.key});

  @override
  State<MyCalculatorAppHome> createState() => _MyCalculatorAppHomeState();
}

class _MyCalculatorAppHomeState extends State<MyCalculatorAppHome> {
  String equation = '0';
  String result = '0';
  String expression = '';

  buttonPressed(btnText) {
    setState(() {
      if (btnText == 'AC') {
        equation = '0';
        result = '0';
      } else if (btnText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (btnText == '=') {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (err) {
          'Error';
        }
      } else {
        if (equation == '0') {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
      }
    });
  }

  Widget calButtons(
      String btnText, Color txtColor, double btnWidth, Color btnColor) {
    return InkWell(
      onTap: () => {buttonPressed(btnText)},
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: btnWidth,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          btnText,
          style: TextStyle(
            color: txtColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              width: double.infinity,
              alignment: Alignment.centerRight,
              color: Colors.black,
              child: SingleChildScrollView(
                child: Text(
                  equation,
                  style: const TextStyle(
                    fontSize: 38.0,
                    color: Colors.white,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 90,
            width: double.infinity,
            alignment: Alignment.centerRight,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 80.0,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons(
                      'AC',
                      Colors.black,
                      75,
                      const Color(0xFFA5A5A5),
                    ),
                    calButtons(
                      '⌫',
                      Colors.black,
                      75,
                      const Color(0xFFA5A5A5),
                    ),
                    calButtons(
                      '%',
                      Colors.black,
                      75,
                      const Color(0xFFA5A5A5),
                    ),
                    calButtons(
                      '÷',
                      Colors.white,
                      75,
                      const Color(0xFFF89B10),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons(
                      '7',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '8',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '9',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      'x',
                      Colors.white,
                      75,
                      const Color(0xFFF89B10),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons(
                      '4',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '5',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '6',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '-',
                      Colors.white,
                      75,
                      const Color(0xFFF89B10),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons(
                      '1',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '2',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '3',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '+',
                      Colors.white,
                      75,
                      const Color(0xFFF89B10),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons(
                      '0',
                      Colors.white,
                      160,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '.',
                      Colors.white,
                      75,
                      const Color(0xFF333333),
                    ),
                    calButtons(
                      '=',
                      Colors.white,
                      75,
                      const Color(0xFFF89B10),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

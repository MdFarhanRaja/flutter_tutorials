import 'package:basic_widgets/cal_button.dart';
import 'package:flutter/material.dart';

class BasicCalculator extends StatefulWidget {
  const BasicCalculator({super.key});

  @override
  State<BasicCalculator> createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  final Gap = const SizedBox(width: 20);
  String result = '', operation = '', selectedOperator = '';
  double val1 = 0, val2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.grey[50]),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              height: 250,
              width: double.infinity,
              color: Colors.grey[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    operation,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    result,
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CalButton(
                  title: 'AC',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '+/-',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '%',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '/',
                  titleColor: Colors.white,
                  bgColor: Colors.orange,
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CalButton(
                  title: '7',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '8',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '9',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: 'X',
                  onClick: (val) {
                    updateValue(val);
                  },
                  titleColor: Colors.white,
                  bgColor: Colors.orange,
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CalButton(
                  title: '4',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '5',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '6',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '-',
                  onClick: (val) {
                    updateValue(val);
                  },
                  titleColor: Colors.white,
                  bgColor: Colors.orange,
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CalButton(
                  title: '1',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '2',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '3',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '+',
                  onClick: (val) {
                    updateValue(val);
                  },
                  titleColor: Colors.white,
                  bgColor: Colors.orange,
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: CalButton(
                      title: '0',
                      onClick: (val) {
                        updateValue(val);
                      },
                    )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '.',
                  onClick: (val) {
                    updateValue(val);
                  },
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '=',
                  onClick: (val) {
                    updateValue(val);
                  },
                  titleColor: Colors.white,
                  bgColor: Colors.orange,
                )),
              ],
            )),
          ],
        ));
  }

  final operators = ['AC', '+/-', '%', '/', 'X', '-', '+', '='];

  void updateValue(String val) {
    if (!operators.contains(val)) {
      result = result + val;
    }
    switch (val) {
      case 'AC':
        result = '';
        operation = '';
        break;
      case '+/-':
        break;
      case '/':
        selectedOperator = '/';
        val1 = double.tryParse(result) ?? 0;
        operation = "${val1.toStringAsFixed(0)} $selectedOperator";
        result = '';
        break;
      case 'X':
        selectedOperator = 'X';
        val1 = double.tryParse(result) ?? 0;
        operation = "${val1.toStringAsFixed(0)} $selectedOperator";
        result = '';
        break;
      case '-':
        selectedOperator = '-';
        val1 = double.tryParse(result) ?? 0;
        operation = "${val1.toStringAsFixed(0)} $selectedOperator";
        result = '';
        debugPrint(val1.toString());
        break;
      case '+':
        selectedOperator = '+';
        val1 = double.tryParse(result) ?? 0;
        operation = "${val1.toStringAsFixed(0)} $selectedOperator";
        result = '';
        debugPrint(val1.toString());
        break;
      case '=':
        val2 = double.tryParse(result) ?? 0;
        operation =
            "${val1.toStringAsFixed(0)} $selectedOperator ${val2.toStringAsFixed(0)}";
        result = calculateResult();
        break;
    }
    setState(() {});
  }

  calculateResult() {
    switch (selectedOperator) {
      case '+':
        return (val1 + val2).toStringAsFixed(0);
      case '-':
        return (val1 - val2).toStringAsFixed(0);
      case 'X':
        return (val1 * val2).toStringAsFixed(0);
      case '/':
        return (val1 / val2).toStringAsFixed(0);
    }
  }
}

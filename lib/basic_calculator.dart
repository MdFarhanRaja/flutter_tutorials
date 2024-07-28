import 'package:basic_widgets/cal_button.dart';
import 'package:flutter/material.dart';

class BasicCalculator extends StatefulWidget {
  const BasicCalculator({super.key});

  @override
  State<BasicCalculator> createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  final Gap = const SizedBox(width: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              height: 250,
              width: double.infinity,
              color: Colors.grey[50],
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '123+23',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    '146',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  )
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CalButton(
                  title: 'AC',
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '+/-',
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '%',
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '/',
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
                  title: '7',
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '8',
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '9',
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: 'X',
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
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '5',
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '6',
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '-',
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
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '2',
                )),
                Gap,
                Expanded(child: CalButton(title: '3')),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '+',
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
                    )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '.',
                )),
                Gap,
                Expanded(
                    child: CalButton(
                  title: '=',
                  titleColor: Colors.white,
                  bgColor: Colors.orange,
                )),
              ],
            )),
          ],
        ));
  }
}

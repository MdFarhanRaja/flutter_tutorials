import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  late TextEditingController etData;

  List<String> dataList = [];

  List<Widget> wrapWidget = [];

  @override
  void initState() {
    etData = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TextField Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: etData,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {
                  validateInputData();
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 3, 138, 52))),
                    hintText: 'Enter Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    validateInputData();
                  },
                  child: const Text('Get Entered Data')),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Wrap(
                          spacing: 10,
                          runSpacing: 20,
                          children: List.generate(
                            wrapWidget.length,
                            (index) {
                              return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(child: wrapWidget[index]),
                                      IconButton(
                                          onPressed: () {
                                            removeItem(index);
                                          },
                                          icon: Icon(Icons.delete))
                                    ],
                                  ));
                            },
                          ))))

              /*  Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  children: List.generate(
                    10,
                    (index) {
                      return Container(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        width: 64,
                        height: 34,
                      );
                    },
                  )) */
            ],
          ),
        ));
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void validateInputData() {
    if (etData.text.isEmpty) {
      showToast('Kindly enter any data');
    } else {
      //dataList.add(etData.text);
      wrapWidget.add(Text(etData.text, style: TextStyle(color: Colors.white)));
      setState(() {});
    }
  }

  void removeItem(int index) {
    wrapWidget.removeAt(index);
    setState(() {});
  }
}

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
              Expanded(
                  child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(dataList[index])),
                      IconButton(
                          onPressed: () {
                            removeItem(index);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ))
                    ],
                  );
                },
              ))
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
      dataList.add(etData.text);
      setState(() {});
    }
  }

  void removeItem(int index) {
    dataList.removeAt(index);
    setState(() {});
  }
}

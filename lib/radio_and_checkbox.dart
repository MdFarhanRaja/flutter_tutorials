import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioAndCheckbox extends StatefulWidget {
  const RadioAndCheckbox({super.key});

  @override
  State<RadioAndCheckbox> createState() => _RadioAndCheckboxState();
}

class _RadioAndCheckboxState extends State<RadioAndCheckbox> {
  int selectedGender = -1, selectedProfession = -1;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio & CheckBox'),
        elevation: 3,
      ),
      body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender'),
                      RadioListTile(
                          toggleable: true,
                          title: Text(
                            'Male',
                            style: TextStyle(
                                fontWeight: selectedGender == 0
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          subtitle: Text('Subtitle'),
                          secondary: Icon(Icons.language),
                          value: 0,
                          activeColor: Colors.green,
                          contentPadding: EdgeInsets.zero,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            selectedGender = value ?? -1;
                            setState(() {});
                          }),
                      RadioListTile(
                          toggleable: true,
                          title: Text(
                            'Female',
                            style: TextStyle(
                                fontWeight: selectedGender == 1
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          activeColor: Colors.green,
                          value: 1,
                          subtitle: Text('Subtitle'),
                          contentPadding: EdgeInsets.zero,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            selectedGender = value ?? -1;
                            setState(() {});
                          }),
                      RadioListTile(
                          toggleable: true,
                          title: Text(
                            'Others',
                            style: TextStyle(
                                fontWeight: selectedGender == 2
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          subtitle: Text('Subtitle'),
                          activeColor: Colors.green,
                          value: 2,
                          contentPadding: EdgeInsets.zero,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            selectedGender = value ?? -1;
                            setState(() {});
                          })
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Profession'),
                      RadioListTile(
                          title: Text('Salaried'),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: Colors.green,
                          value: 0,
                          contentPadding: EdgeInsets.zero,
                          groupValue: selectedProfession,
                          onChanged: (value) {
                            selectedProfession = value!;
                            setState(() {});
                          }),
                      RadioListTile(
                          title: Text('Self Employed'),
                          activeColor: Colors.green,
                          value: 1,
                          contentPadding: EdgeInsets.zero,
                          groupValue: selectedProfession,
                          onChanged: (value) {
                            selectedProfession = value!;
                            setState(() {});
                          })
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Checkbox'),
                      CheckboxListTile(
                          value: rememberMe,
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text('Remember Me'),
                          onChanged: (v) {
                            rememberMe = v!;
                            setState(() {});
                          })
                    ],
                  )),
            ],
          )),
    );
  }
}

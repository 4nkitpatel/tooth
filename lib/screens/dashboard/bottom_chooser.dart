import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/instance_manager.dart';

class ChooseTime extends StatefulWidget {
  @override
  _ChooseTimeState createState() => _ChooseTimeState();
}

enum Timepframe { Weekly, Yearly, Monthly, Today }

class _ChooseTimeState extends State<ChooseTime> {
  Timepframe time = Timepframe.Weekly;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                "Choose Time".text.color(Color(0xffCECECE)).make(),
                10.heightBox,
                RadioListTile<Timepframe>(
                  activeColor: Colors.blue,
                  title: const Text(
                    'Today',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: Timepframe.Today,
                  groupValue: time,
                  onChanged: (Timepframe value) {
                    setState(() {
                      time = value;
                    });
                  },
                ),
                RadioListTile<Timepframe>(
                  activeColor: Colors.blue,
                  title: const Text(
                    'Weekly',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: Timepframe.Weekly,
                  groupValue: time,
                  onChanged: (Timepframe value) {
                    setState(() {
                      time = value;
                    });
                  },
                ),
                RadioListTile<Timepframe>(
                  activeColor: Colors.blue,
                  title: const Text(
                    'Monthly',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: Timepframe.Monthly,
                  groupValue: time,
                  onChanged: (Timepframe value) {
                    setState(() {
                      time = value;
                    });
                  },
                ),
                RadioListTile<Timepframe>(
                  activeColor: Colors.blue,
                  title: const Text(
                    'Yearly',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: Timepframe.Yearly,
                  groupValue: time,
                  onChanged: (Timepframe value) {
                    setState(() {
                      time = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

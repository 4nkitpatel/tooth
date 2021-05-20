import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tooth/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Wgt {
  static getTF(String placeholder) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: placeholder,
          contentPadding: Vx.m2,
          prefixIcon: Icon(Icons.person)),
    ).p16();
  }

  static getToggleBtn() {
    return ToggleSwitch(
      minWidth: 90.0,
      initialLabelIndex: 1,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      labels: ['Male', 'Female'],
      icons: [IconData(0xe800), IconData(0xe800)],
      activeBgColors: [Colors.blue, Colors.pink],
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }

  static getBtn(String text, IconData icn, cb) {
    return TextButton.icon(
      onPressed: cb,
      label: Text(text),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(10),
        backgroundColor: Coolors.orangish,
        primary: Colors.white,
      ),
      icon: Icon(icn),
    ).centered();
  }

  static getImg(String path, double height, double width) {
    return SvgPicture.asset(path,
            fit: BoxFit.contain, height: height, width: width)
        .centered()
        .py32();
  }
}

class DateWgt extends StatefulWidget {
  DateWgt({Key key}) : super(key: key);

  @override
  _SWgtState createState() => _SWgtState();
}

class _SWgtState extends State<DateWgt> {
  DateTime date;
  String getDateText() {
    if (date == null) {
      return "Select Date";
    } else {
      return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
            onPressed: () => pickDate(context),
            label: Text(getDateText()),
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(10),
              backgroundColor: Coolors.orangish,
              primary: Colors.white,
            ),
            icon: Icon(Icons.date_range))
        .centered();
  }

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 18),
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year - 2),
    );
    if (newDate == null) return;
    setState(() => date = newDate);
  }
}

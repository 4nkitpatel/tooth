import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tooth/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:get/get.dart';

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
        backgroundColor: Coolors.secondaryBtn,
        primary: Colors.white,
      ),
      icon: Icon(icn),
    ).centered();
  }

  static getPrimaryBtn({String text, BuildContext context, cb}) {
    return ElevatedButton(
      onPressed: cb,
      child: text.text.make(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Coolors.primaryBtn),
      ),
    ).wFull(context);
  }

  static getSecondaryBtn({String text, BuildContext context, cb}) {
    return ElevatedButton(
      onPressed: cb,
      child:
          text.text.size(MediaQuery.of(context).size.height * 0.02 - 5).make(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Coolors.secondaryBtn),
        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
      ),
    ).wFull(context);
  }

  static getTFF({String text}) {
    return TextFormField(
      style: TextStyle(color: Color(0xff00ADB5)),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Color(0xff00ADB5)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        filled: true,
        focusColor: Color(0xff393E46),
        hoverColor: Color(0xff393E46),
        contentPadding: EdgeInsets.all(10),
        fillColor: Color(0xff393E46),
      ),
    ).pOnly(left: 16, right: 16);
  }

  static getImg(String path, double height, double width) {
    return SvgPicture.asset(path,
            fit: BoxFit.contain, height: height, width: width)
        .centered()
        .py32();
  }

  static showDialog(BuildContext context) {
    final media = MediaQuery.of(context).size;
    Get.defaultDialog(
      title: 'Custom Advice',
      titleStyle: TextStyle(color: Colors.white),
      backgroundColor: Color(0xff353535),
      radius: 10,
      content: Column(
        children: [
          Wgt.getTFF(text: 'Advice'),
          10.heightBox,
          Wgt.getTFF(text: 'Price'),
        ],
      ),
      buttonColor: Color(0xff353535),
      actions: [
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
                Size(media.width * 0.25, media.height * 0.011)),
          ),
          onPressed: () {
            Get.back();
          },
          child: "Cancel".text.make(),
        ),
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
                Size(media.width * 0.25, media.height * 0.011)),
          ),
          onPressed: () {},
          child: "Action".text.make(),
        ),
      ],
    );
  }

  static addExpenseDialog(BuildContext context) {
    final media = MediaQuery.of(context).size;
    Get.defaultDialog(
      title: 'Add Expense',
      titleStyle: TextStyle(color: Colors.white),
      backgroundColor: Color(0xff353535),
      radius: 10,
      content: Column(
        children: [
          Wgt.getTFF(text: 'Clinic name'),
          10.heightBox,
          Wgt.getTFF(text: 'Amount'),
          10.heightBox,
          Wgt.getTFF(text: 'Payment mode'),
        ],
      ),
      buttonColor: Color(0xff353535),
      actions: [
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
                Size(media.width * 0.25, media.height * 0.011)),
          ),
          onPressed: () {
            Get.back();
          },
          child: "Cancel".text.make(),
        ),
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
                Size(media.width * 0.25, media.height * 0.011)),
          ),
          onPressed: () {},
          child: "Add".text.make(),
        ),
      ],
    );
  }

  static showDialogWithSingleInput(BuildContext context) {
    final media = MediaQuery.of(context).size;
    Get.defaultDialog(
      title: "Doctor's O/E",
      titleStyle: TextStyle(color: Colors.white),
      backgroundColor: Color(0xff353535),
      radius: 10,
      content: Column(
        children: [
          Wgt.getTFF(text: 'Enter Your Examination'),
        ],
      ),
      buttonColor: Color(0xff353535),
      actions: [
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
                Size(media.width * 0.25, media.height * 0.011)),
          ),
          onPressed: () {
            Get.back();
          },
          child: "Cancel".text.make(),
        ),
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
                Size(media.width * 0.25, media.height * 0.011)),
          ),
          onPressed: () {},
          child: "Action".text.make(),
        ),
      ],
    );
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
              backgroundColor: Coolors.secondaryBtn,
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

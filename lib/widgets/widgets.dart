import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tooth/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:get/get.dart';

class Wgt {
  String inputValue = '';
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

  static getTFF({String text, onChange, String type, dynamic showPassword}) {
    return TextFormField(
      obscureText: showPassword != null ? showPassword : false,
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
      onChanged: onChange,
      onSaved: onChange,
      validator: (value) {
        return validator(type, value);
      },
    ).pOnly(left: 16, right: 16);
  }

  static String validator(type, value) {
    if (type == "email") {
      if (!GetUtils.isEmail(value))
        return "Email is not valid";
      else
        return null;
    } else if (type == "password") {
      if (value == "")
        return "Please enter valid password";
      else if (value.length < 8)
        return "Please Entered atleast 8 character long password";
      else
        return null;
    } else if (type == "lencheck") {
      if (value == "")
        return "Please enter valid value";
      else if (GetUtils.isNum(value))
        return "Only string/characters are allowed";
      else if (value.length < 2 || value.length > 30)
        return "Entered value can be at most 30 characters";
      else
        return null;
    } else if (type == "phoneno") {
      if (value.length != 10 || !GetUtils.isPhoneNumber(value))
        return "Please enter valid phone number";
      else
        return null;
    } else if (type == "aplhanumeric") {
      if (value == "")
        return "Please enter valid value";
      else if (value.length < 5)
        return "value must me greater then 5 characters";
      else if (!GetUtils.isLengthLessThan(value, 30))
        return "Entered value can be at most 30 characters";
      else
        return null;
    } else if (type == "address") {
      if (value == "")
        return "Please enter valid address";
      else if (!GetUtils.isLengthLessThan(value, 250))
        return "Entered value can be at most 250 characters";
      else
        return null;
    } else if (type == "pincode") {
      if (value == "")
        return "Please enter valid pincode";
      else if (!GetUtils.isNum(value))
        return "Only numbers are allowed";
      else if (value.length != 6)
        return "Please enter a valid pincode";
      else
        return null;
    } else {
      return null;
    }
  }

  static getImg(String path, double height, double width) {
    return SvgPicture.asset(path,
            fit: BoxFit.contain, height: height, width: width)
        .centered()
        .py32();
  }

  static showDialog(BuildContext context, cb) {
    final media = MediaQuery.of(context).size;
    String advice;
    String price;
    Get.defaultDialog(
      title: 'Custom Advice',
      titleStyle: TextStyle(color: Colors.white),
      backgroundColor: Color(0xff353535),
      radius: 10,
      content: Column(
        children: [
          Wgt.getTFF(text: 'Advice', onChange: (value) => advice = value),
          10.heightBox,
          Wgt.getTFF(text: 'Price', onChange: (value) => price = value),
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
          onPressed: () {
            Map<String, dynamic> json = {
              "name": advice,
              "price": price,
            };
            cb(json);
            Get.back();
          },
          child: "Add".text.make(),
        ),
      ],
    );
  }

  // TODO to make it resp u have to use may be Layoutbuiler wrapped with container of some hieght and then decide aval height
  static addMedicationDialog(BuildContext context, cb) {
    String tab;
    String tds;
    String when;
    String days;
    final media = MediaQuery.of(context).size;
    Get.defaultDialog(
      title: 'Add Medications',
      titleStyle: TextStyle(color: Colors.white),
      backgroundColor: Color(0xff353535),
      radius: 10,
      content: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: media.height * 0.3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wgt.getTFF(text: 'Tab', onChange: (value) => tab = value),
              10.heightBox,
              Wgt.getTFF(text: 'TDS', onChange: (value) => tds = value),
              10.heightBox,
              Wgt.getTFF(text: 'When', onChange: (value) => when = value),
              10.heightBox,
              Wgt.getTFF(text: 'Days', onChange: (value) => days = value),
              10.heightBox,
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                  onPressed: () {
                    Map<String, dynamic> json = {
                      "tab": tab,
                      "tds": tds,
                      "when": when,
                      "days": days
                    };
                    cb(json);
                    Get.back();
                  },
                  child: "Add".text.make(),
                ),
              ])
            ],
          ),
        ),
      ),
      buttonColor: Color(0xff353535),
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
  final cb;
  DateWgt({Key key, this.cb}) : super(key: key);

  @override
  _SWgtState createState() => _SWgtState();
}

class _SWgtState extends State<DateWgt> {
  DateTime date;
  bool error = false;
  String getDateText() {
    if (date == null) {
      return "DOB - DD/MM/YYYY";
    } else {
      print("===========");
      // widget.cb('${date.day}/${date.month}/${date.year}');
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: () async {
        var data = await pickDate(context);
        widget.cb(data); // Call Function that has showDatePicker()
      },
      child: Ink(
        color: error ? Colors.transparent : Color(0xff393E46),
        child: IgnorePointer(child: generateTFFDate()),
      ),
    ).pOnly(left: 16, right: 16);
  }

  Widget generateTFFDate() {
    return TextFormField(
      style: TextStyle(color: Color(0xff00ADB5)),
      decoration: InputDecoration(
        hintText: getDateText(),
        hintStyle: TextStyle(color: Color(0xff00ADB5)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        filled: true,
        focusColor: Color(0xff393E46),
        hoverColor: Color(0xff393E46),
        contentPadding: EdgeInsets.all(10),
        fillColor: error ? Color(0xff393E46) : Colors.transparent,
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 18),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year - 2),
    );
    if (newDate == null) return;
    setState(() => date = newDate);
    return '${newDate.day}/${newDate.month}/${newDate.year}';
  }
}

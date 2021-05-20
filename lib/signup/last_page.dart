import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class LastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2A2E43),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.heightBox,
                "Congratulation".text.xl5.color(Colors.white).make().centered(),
                50.heightBox,
                TextFormField(
                  style: TextStyle(color: Color(0xff00ADB5)),
                  decoration: InputDecoration(
                    hintText: "Mob",
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
                ).p16(),
                TextFormField(
                  style: TextStyle(color: Color(0xff00ADB5)),
                  decoration: InputDecoration(
                    hintText: "Dob",
                    hintStyle: TextStyle(color: Color(0xff00ADB5)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Color(0xff393E46),
                  ),
                ).p16(),
                50.heightBox,
                // Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: "Done".text.make(),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff273A5E)),
                  ),
                ).wFull(context).p16(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

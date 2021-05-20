import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tooth/signup/last_page.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatelessWidget {
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
                "You Are \n1/2 Away"
                    .text
                    .xl5
                    .color(Colors.white)
                    .make()
                    .centered(),
                20.heightBox,
                TextFormField(
                  style: TextStyle(color: Color(0xff00ADB5)),
                  decoration: InputDecoration(
                    hintText: "Email",
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
                10.heightBox,
                TextFormField(
                  style: TextStyle(color: Color(0xff00ADB5)),
                  decoration: InputDecoration(
                    hintText: "WhatsApp",
                    hintStyle: TextStyle(color: Color(0xff00ADB5)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Color(0xff393E46),
                  ),
                ).p16(),
                10.heightBox,
                TextFormField(
                  style: TextStyle(color: Color(0xff00ADB5)),
                  decoration: InputDecoration(
                    hintText: "DR",
                    hintStyle: TextStyle(color: Color(0xff00ADB5)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Color(0xff393E46),
                  ),
                ).p16(),
                // 10.heightBox,
                // Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LastPage()));
                  },
                  child: "NEXT".text.make(),
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

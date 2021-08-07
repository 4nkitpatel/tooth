import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Coolors.bgColorP,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 14, right: 14),
            child: Column(
              children: [
                AutoSizeText(
                  "Login",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ).centered().pOnly(top: 30),
                // SizedBox(
                //   height: 20,
                // ),
                SizedBox(
                  height: 40,
                ),
                Image.asset('assets/doctors_1x.png'),
                SizedBox(
                  height: 40,
                ),
                "Welcome to the Tooth".text.color(Colors.white).make(),
                SizedBox(
                  height: 10,
                ),
                Wgt.getTFF(text: "Phone number"),
                SizedBox(
                  height: 20,
                ),
                Wgt.getTFF(text: "Enter password"),
                SizedBox(
                  height: 20,
                ),
                Wgt.getPrimaryBtn(text: "LOG IN", context: context, cb: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

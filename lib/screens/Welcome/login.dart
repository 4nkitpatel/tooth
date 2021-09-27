import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Coolors.bgColorP,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            margin: EdgeInsets.only(left: 14, right: 14),
            child: Column(
              children: [
                AutoSizeText(
                  "Login",
                  style: TextStyle(
                      fontSize: media.height * 0.06, color: Colors.white),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ).centered().pOnly(top: 30),
                // SizedBox(
                //   height: 20,
                // ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  flex: 4,
                  child: AspectRatio(
                    aspectRatio: 3 / 3,
                    child: Image.asset(
                      'assets/doctors_1x.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                "Welcome to the Tooth"
                    .text
                    .size(media.height * 0.03 - 5)
                    .color(Colors.white)
                    .make(),
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
                Wgt.getPrimaryBtn(
                    text: "LOG IN",
                    context: context,
                    cb: () {
                      Get.toNamed("/dashboard");
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

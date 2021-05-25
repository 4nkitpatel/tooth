import 'package:flutter/material.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2A2E43),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 14, right: 14),
            child: Column(
              children: [
                AutoSizeText(
                  "Your Guide \nto Adventure",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                  maxLines: 2,
                ).centered().pOnly(top: 75),
                SizedBox(
                  height: 20,
                ),
                "The best way to navigate your world and discover your capabilities!!!"
                    .text
                    .color(Colors.white)
                    .make(),
                SizedBox(
                  height: 20,
                ),
                Placeholder(
                  fallbackHeight: 200,
                  fallbackWidth: 128,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 50,
                ),
                "Welcome to the Tooth".text.color(Colors.white).make(),
                Wgt.getPrimaryBtn(text: "SIGN IN", context: context, cb: () {}),
                Wgt.getSecondaryBtn(
                    text: "SIGN UP",
                    context: context,
                    cb: () {
                      Navigator.pushNamed(context, "/signup");
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tooth/widgets/widgets.dart';
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
                Wgt.getTFF(text: "Mob"),
                17.heightBox,
                Wgt.getTFF(text: "Dob"),
                50.heightBox,
                // Spacer(),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Wgt.getSecondaryBtn(
                    text: "Done",
                    context: context,
                    cb: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

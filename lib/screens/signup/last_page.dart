import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class LastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "New User".text.size(17).color(Colors.white).center.make(),
        backgroundColor: Color(0xff1F1F1F),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xff222831),
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
                17.heightBox,
                Wgt.getTFF(text: "Registration"),
                17.heightBox,
                // Spacer(),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Wgt.getSecondaryBtn(
                    text: "Done",
                    context: context,
                    cb: () {
                      // Navigator.pushNamed(context, '/dashboard');
                      Get.toNamed("/dashboard");
                    },
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

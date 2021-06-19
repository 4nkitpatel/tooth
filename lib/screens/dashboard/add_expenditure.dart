import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class AddExpenditure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
        appBar: AppBar(
          centerTitle: true,
          title: "Expenditure Details".text.size(15).white.make(),
          // "Mr. Andy".text.size(17).make(),
          backgroundColor: Color(0xff1F2125),
          leadingWidth: 100,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: "Cancel"
                .text
                .color(Color(0xff007AFF))
                .make()
                .pOnly(top: 18, left: 18),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {},
              child: "Done"
                  .text
                  .center
                  .color(Color(0xff007AFF))
                  .make()
                  .pOnly(top: 18, right: 16),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    "Wed, May 31".text.color(Color(0xff0A84FF)).make(),
                    Spacer(),
                    "All Clinics".text.color(Color(0xff0A84FF)).make(),
                  ],
                ),
                50.heightBox,
                Placeholder(
                  color: Colors.white,
                  fallbackHeight: 300,
                  fallbackWidth: MediaQuery.of(context).size.width,
                ),
                30.heightBox,
                AutoSizeText(
                  "OOPS!!! No Expenses are added to this branch.Please add if you missed it.Adding expenses help you track and budgeting for the month.",
                  style: TextStyle(color: Color(0xff989696)),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ).centered(),
                20.heightBox,
                Wgt.getSecondaryBtn(
                  text: 'Add Expense',
                  context: context,
                  cb: () {
                    // Navigator.pushNamed(context, "/patients");
                    Get.toNamed("/patients");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

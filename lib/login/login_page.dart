import 'package:flutter/material.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Container(
              color: Coolors.purplish,
            ),
            Container(
              width: context.screenWidth,
              height: context.percentHeight * 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  )),
              child: VStack([
                Wgt.getImg("assets/profile.svg", 200, 200),
                RichText(
                        text: TextSpan(
                            text: "Already Registered ?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Coolors.purplish,
                                fontSize: 25)))
                    .centered(),
                Wgt.getTF("Registration No"),
                Wgt.getBtn("Search", Icons.search, () {
                  print("hello");
                }),
              ]),
            ),
            Positioned(
              child: TextButton(
                onPressed: () {},
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  label: Text("Create New Registration"),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Coolors.orangish)),
                  icon: Icon(Icons.create),
                ).centered(),
              ),
              bottom: 24,
              left: 70,
            )
          ],
        ),
      ),
    );
  }
}

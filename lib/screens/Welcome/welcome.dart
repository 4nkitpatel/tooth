import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> userData;
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      if (userData != null && userData.length > 0)
        Get.toNamed('/dashboard', arguments: userData[1]);
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var userdata = sharedPreferences.getStringList("userdata");
    print(userdata);
    setState(() {
      userData = userdata;
    });
  }

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
                  "Your Guide \nto Adventure",
                  style: TextStyle(
                      fontSize: media.height * 0.07 - 5, color: Colors.white),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ).centered().pOnly(top: media.height * 0.04 - 5),
                SizedBox(
                  height: 20,
                ),
                "The best way to navigate your world and discover your capabilities!!!"
                    .text
                    .size(media.height * 0.02 - 5)
                    .center
                    .color(Colors.white)
                    .make(),
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
                // SizedBox(
                //   height: 40,
                // ),
                Spacer(),
                "Welcome to the Tooth".text.color(Colors.white).make(),
                SizedBox(
                  height: 10,
                ),
                Wgt.getPrimaryBtn(
                    text: "SIGN IN",
                    context: context,
                    cb: () {
                      Get.toNamed('/login');
                    }),
                Wgt.getSecondaryBtn(
                    text: "SIGN UP",
                    context: context,
                    cb: () {
                      // Navigator.pushNamed(context, "/signup");
                      Get.toNamed('/signup');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

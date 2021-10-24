import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/services/api.service.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneno;
  final formKey = GlobalKey<FormState>();
  String pass;
  bool passwordShow = true;

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
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  Wgt.getTFF(
                    text: "Phone number",
                    type: "phoneno",
                    onChange: (val) => phoneno = val,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wgt.getTFF(
                    text: "Enter password",
                    type: "password",
                    showPassword: passwordShow,
                    onChange: (val) => pass = val,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        passwordShow = !passwordShow;
                        print(passwordShow);
                      });
                    },
                    child: passwordShow
                        ? "Show password".text.blue400.underline.make()
                        : "Hide password".text.blue400.underline.make(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wgt.getPrimaryBtn(
                      text: "LOG IN",
                      context: context,
                      cb: () async {
                        final isValid = formKey.currentState.validate();
                        if (isValid) {
                          formKey.currentState.save();
                          Map<String, String> args = {
                            "phoneno": phoneno,
                            "pass": pass
                          };
                          // API call on success
                          var message = await ApiServices.onLogin(args);
                          // redirect to
                          if (message["status"] == 201) {
                            Get.offAllNamed("/dashboard",
                                arguments: message['data']);
                          } else {
                            Get.snackbar(
                              "Error",
                              message["message"],
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        }
                        // Get.toNamed("/dashboard");
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

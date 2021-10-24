import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controllers/AddressList.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/instance_manager.dart';

class AddressListPage extends StatefulWidget {
  final Function cb;
  const AddressListPage({Key key, this.cb}) : super(key: key);
  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  final AddressListController addressC = Get.put(AddressListController());
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TextFormField(
                //   style: TextStyle(color: Color(0xff00ADB5)),
                //   decoration: InputDecoration(
                //     hintText: 'Search',
                //     hintStyle: TextStyle(color: Color(0xff00ADB5)),
                //     border: OutlineInputBorder(
                //       borderSide: BorderSide.none,
                //     ),
                //     filled: true,
                //     focusColor: Color(0xff393E46),
                //     hoverColor: Color(0xff393E46),
                //     contentPadding: EdgeInsets.only(left: 20),
                //     fillColor: Color(0xff393E46),
                //   ),
                // ),
                // 20.heightBox,
                "Suggested Searches".text.color(Color(0xffCECECE)).make(),
                10.heightBox,
                Container(
                  height: media.height * 0.5,
                  // color: Colors.pinkAccent,
                  child: Obx(
                    () {
                      if (addressC.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else
                        return ListView.separated(
                          separatorBuilder: (context, index) => 10.heightBox,
                          itemCount: addressC.addressList.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                // color: Color(0xff003049),
                                color: Color(0xff2C2C2E),
                                width: MediaQuery.of(context).size.width,
                                height: media.height * 0.1,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        addressC.addressList[index].address.text
                                            .white
                                            .make(),
                                        addressC
                                            .addressList[index].addressName.text
                                            .size(10)
                                            .white
                                            .make(),
                                      ],
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      shape: CircleBorder(),
                                      fillColor: MaterialStateProperty.all(
                                          Color(0xff0A84FF)),
                                      value: addressC.isSelected[index],
                                      onChanged: (value) {
                                        // print(value);
                                        // print(addressC.addressList[index]);
                                        // print(addressC.isSelected);
                                        setState(() {
                                          addressC.isSelected[index] = value;
                                          widget.cb(addressC.addressList[index],
                                              value);
                                        });
                                      },
                                    ),
                                    // Radio(
                                    //   activeColor: Colors.red,
                                    //   fillColor:
                                    //       MaterialStateProperty.all(Colors.white),
                                    //   value: index,
                                    //   groupValue: -1,
                                    //   onChanged: (value) {
                                    //     print(value);
                                    //   },
                                    // ),
                                  ],
                                ).p8(),
                              ),
                            );
                          },
                        );
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

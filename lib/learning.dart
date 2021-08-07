import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:velocity_x/velocity_x.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // * if we chhnage this color to dark it changes to dark mode
      themeMode: ThemeMode.light,
      // * this uses that color to all other pages when it comes to default color like app bar and all
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: "",
      ), // * GoogleFonts.loto().fontFamily
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      // * generally make central place for this and make it static and use here and evrywhere u wnat
      routes: {
        "/": (context) => Text("just work around"),
        "/home": (context) => Text("just work around"),
        "/login": (context) => Text("just work around")
      },
    );
  }
}

// * some times ctrl + space u have to press carefully to get exactly what you want
class Learning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // * Root material wrapper for that white screen
    return Material(
      // * always see what all option we have for that perticular widget and also check signature what it accepts
      color: Colors.white,
      // * this helps auto scrolling screen in smaller device and also helo when you open keyboard and all the filed automatically goes up and we can also scroll
      child: SingleChildScrollView(
        // * to use multiple widgets column wise bcz this hsa property of children that accepts array of widgets
        child: Column(
          children: [
            Image.asset(
              "assets/profile.svg",
              fit: BoxFit.cover,
            ), // * some time you have to see is there any second argument ans also see whats the possible options
            SizedBox(
              height: 20.0,
            ), // * see in this i saw hight is there and only accepts double so that helps
            Text(
              "We all use this but see second paramtere",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ), // * if I hover to style it syas TextStyle so i used that see it helps,
            ),
            Padding(
              // * same i used ctrl+space and used optitons and saw signature of it
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  // * used column for username and password as a grp also checked signature to get that  InputDecoration()
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Phonenumber", labelText: "Username"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Username", labelText: "Username"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Login"),
                    style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  ),
                  // ! WHAT IF I WANT TO MAKE MY OWN BUTTON OR WIDGET
                  // ? to work with that tap effect u may use Ink() as child and not COntainer() as child
                  // ? second is wrap it with Matreial() bcz it worked with it and then U MUST MOVE UR DECORATION PART TO MATERIAL
                  // ?  WIDGET AND NOT  UR Container()
                  InkWell(
                    // ? MOST IMP TO CONVERT THAT WIDGET TO TAPPABLE OR CLICKABLE WE USED THIS INKWELL
                    onTap: () async {
                      Navigator.pushNamed(context, "/home");
                      /*
                        ? setState(() {
                        ?   changedBtn = true
                        ? })
                        ? await Future.delayed(Duration(seconds: 1)) // waait for 1 second as amination is running for 1 seconds
                        ? Navigator.pushNamed(context, "/home");
                      */
                    },
                    // TODO u can use AnimatedContainer() instead of Container for amination duration property must
                    // * duration : Furation(seconds: 1)
                    // * u can use flag for the same and setStat(){} to see amination
                    // * class level varibale are inbuit are state so when change just call setStage(){} to re render
                    child: Container(
                      width: 150,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  // ? THIS Hero tag used for simple animation its attched to image so when in other page you want to show that image
                  // ? with some animation u can use the same tag:and Key so its will animate simple
                  Hero(tag: Key("123"), child: Image.network("url")),
                  // ? this will give beutyfull top curv in box like u curv
                  VxArc(
                    height: 20,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  // ? this gives whole row for button and pricing like information [$999         (BUY)]
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$999".text.make(),
                      ElevatedButton(
                          onPressed: () {},
                          child: "Buy".text.make(),
                          style: ButtonStyle())
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ! U can use _formKey = GlobalKey<FormState>();
// ? and the in TextFormField u can usee validator and take value and check it
// ? after that on Tap u can check _formKey.currentState.validate() -> return true or false and render error

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple, //? to give color to whole drawer
        // ? used ListView as that give childrens
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text('Ankit'),
                accountEmail: Text('ankpatel@deloitte.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("url"),
                ),
              ),
            ),
            //? gives some much styling onTap also there and all propery u can see
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ? Listview.builder on scroll load the data
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        // ? this ItemWidget is custom model for product
        // ? return ItemWidget(item: null);
      },
    );
  }
}

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ! THIS GIVES A BOX OF WHOLE WIDTH WITH PLACE HOLDER LIKE boc with cross inside u can use this to get where u will put which widget like wireframe type awsome feature
        Placeholder().p32().expand(),
        Divider(),
        Placeholder()
      ],
    );
  }
}

// TODO this will show little message comming from bottom that not suported yet
class MessageFromBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: "Buying not supported yet".text.make(),
          ),
        );
      },
      child: "Buy".text.make(),
    );
  }
}

// ! u can use in icon button or floating button .badge() provided by vx so that use too give that message count effect that we have in WA
// ! like in whatsapp if we get messagae little red dot appearse in WA icon
// TODO ? we can use sliver that take chilfren and many many more things
// TODO ShaderMask() widget look into it - make something shaded or gradianrt by wrapping this widget
// TODO ClipRRect() widget add border radius and all to any widget which is rectangle
// TODO - we also have ClipOval() , ClipPath() and more
// TODO TabBar() one side widget many many widget in it r & d

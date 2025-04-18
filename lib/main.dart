import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/screens/Welcome/login.dart';
import 'package:tooth/screens/Welcome/welcome.dart';
import 'package:tooth/screens/dashboard/add_clinic.dart';
import 'package:tooth/screens/dashboard/advice.dart';
import 'package:tooth/screens/dashboard/dashboard.dart';
import 'package:tooth/screens/dashboard/expenditure_details.dart';
import 'package:tooth/screens/dashboard/income_details.dart';
import 'package:tooth/screens/dashboard/medication.dart';
import 'package:tooth/screens/dashboard/patient_details.dart';
import 'package:tooth/screens/dashboard/patients.dart';
import 'package:tooth/screens/dashboard/schedule.dart';
import 'package:tooth/screens/dashboard/symptoms.dart';
import 'package:tooth/screens/signup/last_page.dart';
import 'package:tooth/screens/signup/signup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MyApp(), // Wrap your app
  );
}
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(), // Wrap your app
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vendor',
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 369),
      theme: ThemeData(
        primaryColor: Coolors.bgColorT,
        accentColor: Coolors.appBar,
        unselectedWidgetColor: Colors.white,
      ),
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder, // Add the builder here
      home: WelcomePage(),
      // initialRoute: '/',
      getPages: [
        // GetPage(name: '/', page: () => WelcomePage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/afterSignup', page: () => LastPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/addclinic', page: () => AddClinicPage()),
        GetPage(name: '/dashboard', page: () => DashboardPage()),
        GetPage(name: '/advice', page: () => AdvicePage()),
        GetPage(name: '/medication', page: () => MedicationPage()),
        GetPage(name: '/patientDetails', page: () => PatientDetailsPage()),
        GetPage(name: '/symptoms', page: () => SymptomsPage()),
        GetPage(
            name: '/expenditureDetails', page: () => ExpenditureDetailsPage()),
        GetPage(name: '/incomeDetails', page: () => IncomeDetailsPage()),
        GetPage(name: '/patients', page: () => PatientsPage()),
        GetPage(
          name: '/schedule',
          page: () => SchedulePage(),
          transitionDuration: Duration(milliseconds: 500),
          transition: Transition.rightToLeft,
        )
      ],
      // routes: {
      //   '/signup': (context) => SignUpPage(),
      //   '/login': (context) => LoginPage(),
      //   '/firstvisit': (context) => FirstVisit(),
      //   '/expenditure': (context) => ExpenditurePage(),
      //   '/dashboard': (context) => DashboardPage(),
      //   '/advice': (context) => AdvicePage(),
      //   '/patientDetails': (context) => PatientDetailsPage(),
      //   '/symptoms': (context) => SymptomsPage(),
      //   '/expenditureDetails': (context) => ExpenditureDetailsPage(),
      //   '/patients': (context) => PatientsPage(),
      //   '/schedule': (context) => SchedulePage(),
      // },
    );
  }
}

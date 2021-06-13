import 'package:flutter/material.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/login/login_page.dart';
import 'package:tooth/pages/expenditure.dart';
import 'package:tooth/pages/first_visit.dart';
import 'package:tooth/screens/Welcome/welcome.dart';
import 'package:tooth/screens/dashboard/dashboard.dart';
import 'package:tooth/screens/dashboard/expenditure_details.dart';
import 'package:tooth/screens/dashboard/patient_details.dart';
import 'package:tooth/screens/dashboard/patients.dart';
import 'package:tooth/screens/dashboard/schedule.dart';
import 'package:tooth/screens/dashboard/symptoms.dart';
import 'package:tooth/screens/signup/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vendor',
      theme: ThemeData(
          primaryColor: Coolors.bgColorT, accentColor: Coolors.appBar),
      home: WelcomePage(),
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/firstvisit': (context) => FirstVisit(),
        '/expenditure': (context) => ExpenditurePage(),
        '/dashboard': (context) => DashboardPage(),
        '/patientDetails': (context) => PatientDetailsPage(),
        '/symptoms': (context) => SymptomsPage(),
        '/expenditureDetails': (context) => ExpenditureDetailsPage(),
        '/patients': (context) => PatientsPage(),
        '/schedule': (context) => SchedulePage(),
      },
    );
  }
}

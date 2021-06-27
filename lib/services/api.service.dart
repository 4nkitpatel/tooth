import 'package:http/http.dart' as http;
import 'package:tooth/models/AdviceList.dart';
import 'package:tooth/models/Expenditures.dart';
import 'package:tooth/models/Materials.dart';
import 'package:tooth/models/Medication.dart';
import 'package:tooth/models/Patients.dart';
import 'package:tooth/models/Schedule.dart';
import 'package:tooth/models/symptoms.dart';

class ApiServices {
  static var client =
      http.Client(); // dont want chnage and open connection adain and again

  static Future<List<Symptoms>> fetchSymptoms() async {
    var res = await client.get(Uri.http('127.0.0.1:3000', '/Symptoms'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // this will given my model may be from app.quicktype.io
      return symptomsFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Medication>> fetchMedications() async {
    var res = await client.get(Uri.http('127.0.0.1:3000', '/medication'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // this will given my model may be from app.quicktype.io
      return medicationFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Schedule>> fetchSchedules() async {
    var res = await client.get(Uri.http('127.0.0.1:3000', '/schedule'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // this will given my model may be from app.quicktype.io
      return scheduleFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Patients>> fetchPatients() async {
    var res = await client.get(Uri.http('127.0.0.1:3000', '/patients'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // this will given my model may be from app.quicktype.io
      return patientsFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Expenditures>> fetchExpenditures() async {
    var res = await client.get(Uri.http('127.0.0.1:3000', '/expenditures'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // this will given my model may be from app.quicktype.io
      return expendituresFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Materials>> fetchMaterials() async {
    var res = await client.get(Uri.http('127.0.0.1:3000', '/materials'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // this will given my model may be from app.quicktype.io
      return materialsFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }

  static Future<List<AdviceList>> fetchAdviceList() async {
    var res = await client.get(Uri.http('127.0.0.1:3000', '/advice'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // this will given my model may be from app.quicktype.io
      return adviceListFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tooth/models/AddressList.dart';
import 'package:tooth/models/AdviceList.dart';
import 'package:tooth/models/Expenditures.dart';
import 'package:tooth/models/Materials.dart';
import 'package:tooth/models/Medication.dart';
import 'package:tooth/models/Patients.dart';
import 'package:tooth/models/Schedule.dart';
import 'package:tooth/models/symptoms.dart';

// TODO id is string and we gave as number and also check model
class ApiServices {
  static var client =
      http.Client(); // dont want chnage and open connection adain and again

  static Future<List<Symptoms>> fetchSymptoms() async {
    // var res = await client.get(Uri.http('127.0.0.1:3000', '/Symptoms'));
    var res =
        await client.get(Uri.http('3.23.102.140:7000', '/api/v1/Symptoms'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      print(jsonDecode(jsonStr)['data']);
      var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // return symptomsFromJson(jsonStr);
      return symptomsFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Medication>> fetchMedications() async {
    var res =
        await client.get(Uri.http('3.23.102.140:7000', '/api/v1/medication'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      print(jsonDecode(jsonStr)['data']);
      var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      // return medicationFromJson(jsonStr);
      return medicationFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Address>> fetchAddressList() async {
    var res =
        await client.get(Uri.http('3.23.102.140:7000', '/api/v1/address'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      print(jsonDecode(jsonStr)['data']);
      var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      // return addressFromJson(jsonStr);
      return addressFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Schedule>> fetchSchedules() async {
    var res =
        await client.get(Uri.http('3.23.102.140:7000', '/api/v1/schedule'));
    // await client.get(Uri.http('localhost:3000', '/schedule'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      print(jsonDecode(jsonStr)['data']);
      var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      // return scheduleFromJson(jsonStr);
      return scheduleFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Patients>> fetchPatients() async {
    var res =
        await client.get(Uri.http('3.23.102.140:7000', '/api/v1/patients'));
    // var res = await client.get(Uri.http('localhost:3000', '/patients'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      print(jsonDecode(jsonStr)['data']);
      var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      return patientsFromJson(data);
      // return patientsFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Expenditures>> fetchExpenditures() async {
    var res =
        await client.get(Uri.http('3.23.102.140:7000', '/api/v1/expenditures'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      print(jsonDecode(jsonStr)['data']);
      var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      return expendituresFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Materials>> fetchMaterials() async {
    var res =
        await client.get(Uri.http('3.23.102.140:7000', '/api/v1/materials'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      print(jsonDecode(jsonStr)['data']);
      var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      return materialsFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<AdviceList>> fetchAdviceList() async {
    var res = await client.get(Uri.http('3.23.102.140:7000', '/api/v1/advice'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;

      print(jsonDecode(jsonStr)['data']);
      var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      // return adviceListFromJson(jsonStr);
      return adviceListFromJson(data);
    } else {
      return null; //handle it
    }
  }
}

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
import 'package:tooth/models/todaysApp.dart';

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

  // static Future<List<TodaysApp>> fetchTodaysApp() async {
  //   var res = await client.get(Uri.http('127.0.0.1:3000', '/todaysApp'));
  //   // var res =
  //   //     await client.get(Uri.http('3.23.102.140:7000', '/api/v1/Symptoms'));
  //   if (res.statusCode == 200) {
  //     var jsonStr = res.body;
  //     // print(jsonDecode(jsonStr)['data']);
  //     // var data = jsonEncode(jsonDecode(jsonStr)['data']);
  //     return todaysAppFromJson(jsonStr);
  //     // return todaysAppFromJson(data);
  //   } else {
  //     return null; //handle it
  //   }
  // }

  static Future<Map<String, dynamic>> fetchUserStats(
      {String time, String location}) async {
    final queryParams = {'time': time, 'location': location};
    var res =
        await client.get(Uri.http('127.0.0.1:3000', '/userStats', queryParams));
    // var res =
    //     await client.get(Uri.http('3.23.102.140:7000', '/api/v1/Symptoms'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      print("=================> $jsonStr");
      print(jsonDecode(jsonStr));
      // print(jsonDecode(jsonStr)['data']);
      // var data = jsonEncode(jsonDecode(jsonStr)['data']);
      return jsonDecode(jsonStr);
      // return symptomsFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Medication>> fetchMedications() async {
    // var res =
    //     await client.get(Uri.http('3.23.102.140:7000', '/api/v1/medication'));
    var res = await client.get(Uri.http('localhost:3000', '/medication'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // print(jsonDecode(jsonStr)['data']);
      // var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      return medicationFromJson(jsonStr);
      // return medicationFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List> fetchTeethStatus() async {
    var res = await client.get(Uri.http('localhost:3000', '/teethStatus'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      print("=================> $jsonStr");
      print(jsonDecode(jsonStr));
      // var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      return jsonDecode(jsonStr);
      // return medicationFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Address>> fetchAddressList() async {
    // var res =
    //     await client.get(Uri.http('3.23.102.140:7000', '/api/v1/address'));
    var res = await client.get(Uri.http('localhost:3000', '/address'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // print(jsonDecode(jsonStr)['data']);
      // var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      return addressFromJson(jsonStr);
      // return addressFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Schedule>> fetchSchedules({filter}) async {
    var queryParams;
    if (filter.toString().isNotEmpty) {
      queryParams = {'time': filter.toString()};
    }
    // var res =
    //     await client.get(Uri.http('3.23.102.140:7000', '/api/v1/schedule'));
    var res =
        await client.get(Uri.http('localhost:3000', '/schedule', queryParams));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // print(jsonDecode(jsonStr)['data']);
      // var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      return scheduleFromJson(jsonStr);
      // return scheduleFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Patients>> fetchPatients({String param}) async {
    final queryParams = {'time': param};
    // var res =
    //     await client.get(Uri.http('3.23.102.140:7000', '/api/v1/patients'));
    var res =
        await client.get(Uri.http('localhost:3000', '/patients', queryParams));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // print(jsonDecode(jsonStr)['data']);
      // var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      // return patientsFromJson(data);
      return patientsFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Expenditures>> fetchExpenditures({String param}) async {
    final queryParams = {'time': param};
    var res = await client
        .get(Uri.http('localhost:3000', '/expenditures', queryParams));
    // var res =
    //     await client.get(Uri.http('3.23.102.140:7000', '/api/v1/expenditures'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // print(jsonDecode(jsonStr)['data']);
      // var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      // return expendituresFromJson(data);
      return expendituresFromJson(jsonStr);
    } else {
      return null; //handle it
    }
  }

  static Future<List<Materials>> fetchMaterials({String param}) async {
    final queryParams = {'time': param};
    var res =
        await client.get(Uri.http('localhost:3000', '/materials', queryParams));
    // var res =
    //     await client.get(Uri.http('3.23.102.140:7000', '/api/v1/materials'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;
      // print(jsonDecode(jsonStr)['data']);
      // var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      return materialsFromJson(jsonStr);
      // return materialsFromJson(data);
    } else {
      return null; //handle it
    }
  }

  static Future<List<AdviceList>> fetchAdviceList() async {
    // var res = await client.get(Uri.http('3.23.102.140:7000', '/api/v1/advice'));
    var res = await client.get(Uri.http('localhost:3000', '/advice'));
    if (res.statusCode == 200) {
      var jsonStr = res.body;

      // print(jsonDecode(jsonStr)['data']);
      // var data = jsonEncode(jsonDecode(jsonStr)['data']);
      // this will given my model may be from app.quicktype.io
      return adviceListFromJson(jsonStr);
      // return adviceListFromJson(data);
    } else {
      return null; //handle it
    }
  }

  // POST calls
  static Future<http.Response> onMedication(json) async {
    final url = Uri.parse('http://localhost:3000/medicationData');
    final headers = {"Content-type": "application/json"};
    final res =
        await client.post(url, headers: headers, body: jsonEncode(json));
    if (res.statusCode == 201) {
      print('Body: ${res.body}');
      return res;
    } else {
      return null;
    }
  }

  static Future<http.Response> onAdvice(json) async {
    final url = Uri.parse('http://localhost:3000/advice');
    final headers = {"Content-type": "application/json"};
    final res =
        await client.post(url, headers: headers, body: jsonEncode(json));
    if (res.statusCode == 201) {
      print('Body: ${res.body}');
      return res;
    } else {
      return null;
    }
  }
  // TODO may be ID bhejna ? co BE me true kar dega may be
  // static Future<http.Response> onSelectedAdvice(json) async {
  //   final url = Uri.parse('http://localhost:3000/advice');
  //   final headers = {"Content-type": "application/json"};
  //   final res =
  //       await client.post(url, headers: headers, body: jsonEncode(json));
  //   if (res.statusCode == 201) {
  //     print('Body: ${res.body}');
  //     return res;
  //   } else {
  //     return null;
  //   }
  // }

  static Future<Map<dynamic, dynamic>> sendGreetings(json) async {
    final url = Uri.parse('http://localhost:3000/greetings');
    final headers = {"Content-type": "application/json"};
    final res =
        await client.post(url, headers: headers, body: jsonEncode(json));
    if (res.statusCode == 201) {
      print('Body: ${res.body}');
      return {
        "data": res.body,
        "message": "Successfully sent a greetings",
        "status": res.statusCode
      };
      // return res;
    } else {
      return {
        "data": res.body,
        "message": "Something went wrong while sending",
        "status": res.statusCode
      };
    }
  }

  static Future<Map<dynamic, dynamic>> onAppointmentApprove(json) async {
    final url = Uri.parse('http://localhost:3000/approvedappointment');
    final headers = {"Content-type": "application/json"};
    final res =
        await client.post(url, headers: headers, body: jsonEncode(json));
    if (res.statusCode == 201) {
      print('Body: ${res.body}');
      return {
        "data": res.body,
        "message": "Successfully sent appointment",
        "status": res.statusCode
      };
      // return res;
    } else {
      return {
        "data": res.body,
        "message": "Something went wrong while appointing",
        "status": res.statusCode
      };
    }
  }

  static Future<Map<dynamic, dynamic>> onSignUp(json) async {
    final url = Uri.parse('http://localhost:3000/signup');
    final headers = {"Content-type": "application/json"};
    final res =
        await client.post(url, headers: headers, body: jsonEncode(json));
    if (res.statusCode == 201) {
      print('Body: ${res.body}');
      return {
        "data": res.body,
        "message": "SignUp successfully",
        "status": res.statusCode
      };
    } else {
      return {
        "data": res.body,
        "message": "Something went wrong",
        "status": res.statusCode
      };
    }
  }

  static Future<Map<dynamic, dynamic>> onAddClinic(json) async {
    final url = Uri.parse('http://localhost:3000/addclinic');
    final headers = {"Content-type": "application/json"};
    final res =
        await client.post(url, headers: headers, body: jsonEncode(json));
    if (res.statusCode == 201) {
      print('Body: ${res.body}');
      return {
        "data": res.body,
        "message": "Add Clinic successfully",
        "status": res.statusCode
      };
    } else {
      return {
        "data": res.body,
        "message": "Something went wrong",
        "status": res.statusCode
      };
    }
  }

  static Future<Map<dynamic, dynamic>> onLogin(json) async {
    final url = Uri.parse('http://localhost:3000/login');
    final headers = {"Content-type": "application/json"};
    final res =
        await client.post(url, headers: headers, body: jsonEncode(json));
    if (res.statusCode == 201) {
      print('Body: ${res.body}');
      return {
        "data": "Name", // TODO we need drName in res.body
        "message": "login successfully",
        "status": res.statusCode
      };
    } else {
      return {
        "data": res.body,
        "message": "Something went wrong",
        "status": res.statusCode
      };
    }
  }
}

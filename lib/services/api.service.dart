import 'package:http/http.dart' as http;
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
}

import 'package:get/state_manager.dart';
import 'package:tooth/models/Patients.dart';
import 'package:tooth/services/api.service.dart';

class PatientsController extends GetxController {
  var patientsList = List<Patients>.empty().obs;
  // var filteredList = List<Patients>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPatients();
  }

  Future fetchPatients() async {
    try {
      isLoading(true);
      var patients = await ApiServices.fetchPatients();
      if (patients != null) {
        patientsList.value = patients;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> sendGreetings(json) async {
    // '{"tab": "2Tab","when": "BF","days": "15"}'
    var response = await ApiServices.sendGreetings(json);
    print("data $response");
    if (response["status"] == 201) {
      // return response.body; //"Successfully added";
      return response;
    } else {
      return response;
    }
  }
}

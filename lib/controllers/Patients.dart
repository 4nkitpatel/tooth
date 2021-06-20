import 'package:get/state_manager.dart';
import 'package:tooth/models/Patients.dart';
import 'package:tooth/services/api.service.dart';

class PatientsController extends GetxController {
  var patientsList = List<Patients>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPatients();
  }

  void fetchPatients() async {
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
}

import 'package:get/state_manager.dart';
import 'package:tooth/models/Medication.dart';
import 'package:tooth/services/api.service.dart';

class MedicationController extends GetxController {
  var medicationsList = List<Medication>.empty().obs;
  var isSelected = List<bool>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMedications();
  }

  void fetchMedications() async {
    try {
      isLoading(true);
      var medications = await ApiServices.fetchMedications();
      if (medications != null) {
        medicationsList.value = medications;
        isSelected.value =
            List<bool>.filled(medications.length, false).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}

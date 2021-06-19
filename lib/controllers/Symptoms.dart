import 'package:get/state_manager.dart';
import 'package:tooth/models/symptoms.dart';
import 'package:tooth/services/api.service.dart';

class SymptomsController extends GetxController {
  var symptomsList = List<Symptoms>().obs;
  var isSelected = List<bool>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSymptoms();
  }

  void fetchSymptoms() async {
    try {
      isLoading(true);
      var symptoms = await ApiServices.fetchSymptoms();
      if (symptoms != null) {
        symptomsList.value = symptoms;
        isSelected.value = List<bool>.filled(symptoms.length, false).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}

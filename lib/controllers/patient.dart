import 'package:get/state_manager.dart';
import 'package:tooth/services/api.service.dart';

class PatientController extends GetxController {
  var teethStatus = List.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeethStatus();
  }

  void fetchTeethStatus() async {
    try {
      isLoading(true);
      var status = await ApiServices.fetchTeethStatus();
      if (status != null) {
        teethStatus.value = status;
      }
    } finally {
      isLoading(false);
    }
  }
}

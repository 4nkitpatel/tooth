import 'package:get/state_manager.dart';
import 'package:tooth/models/Expenditures.dart';
import 'package:tooth/services/api.service.dart';

class ExpendituresController extends GetxController {
  var expendituresList = List<Expenditures>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchExpenditures();
  }

  void fetchExpenditures() async {
    try {
      isLoading(true);
      var expenditures = await ApiServices.fetchExpenditures();
      if (expenditures != null) {
        expendituresList.value = expenditures;
      }
    } finally {
      isLoading(false);
    }
  }
}

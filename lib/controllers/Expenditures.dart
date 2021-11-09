import 'package:get/state_manager.dart';
import 'package:tooth/models/Expenditures.dart';
import 'package:tooth/models/Materials.dart';
import 'package:tooth/services/api.service.dart';

class ExpendituresController extends GetxController {
  var expendituresList = List<Expenditures>.empty().obs;
  var materialList = List<Materials>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchExpenditures();
  }

  Future fetchExpenditures({String time = 'Default'}) async {
    try {
      isLoading(true);
      var expenditures = await ApiServices.fetchExpenditures(param: time);
      if (expenditures != null) {
        expendituresList.value = expenditures;
      }
    } finally {
      isLoading(false);
    }
  }

  Future fetchMaterials({String time = 'Default'}) async {
    try {
      isLoading(true);
      var materials = await ApiServices.fetchMaterials(param: time);
      if (materials != null) {
        materialList.value = materials;
      }
    } finally {
      isLoading(false);
    }
  }
}

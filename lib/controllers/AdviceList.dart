import 'package:get/state_manager.dart';
import 'package:tooth/models/AdviceList.dart';
import 'package:tooth/services/api.service.dart';

class AdviceListController extends GetxController {
  var adviceList = List<AdviceList>.empty().obs;
  var isSelected = List<bool>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAdviceList();
  }

  void fetchAdviceList() async {
    try {
      isLoading(true);
      var advices = await ApiServices.fetchAdviceList();
      if (advices != null) {
        adviceList.value = advices;
        isSelected.value = List<bool>.filled(advices.length, false).toList();
      }
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> onAdvice(json) async {
    // '{"tab": "2Tab","when": "BF","days": "15"}'
    var response = await ApiServices.onAdvice(json);
    print("data $response");
    if (response.statusCode == 201) {
      // return response.body; //"Successfully added";
      return "Successfully added";
    } else {
      return "Something went wrong";
    }
  }

  // Future<dynamic> onSelectedAdvice(json) async {
  //   // '{"tab": "2Tab","when": "BF","days": "15"}'
  //   var response = await ApiServices.onSelectedAdvice(json);
  //   print("data $response");
  //   if (response.statusCode == 201) {
  //     // return response.body; //"Successfully added";
  //     return "Successfully selected";
  //   } else {
  //     return "Something went wrong";
  //   }
  // }
}

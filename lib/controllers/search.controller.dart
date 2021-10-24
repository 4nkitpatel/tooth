import 'package:get/state_manager.dart';

class SearchController extends GetxController {
  var searchResult = List.empty().obs;
  var searchText = "".obs;
  List details;
  @override
  void onInit() {
    super.onInit();
  }

  initializeDetails(List data) {
    print("data ================> $data");
    details = data;
  }

  onSearchTextChanged(String text) async {
    searchResult.clear();
    if (text.isEmpty) {
      searchText = "".obs;
      return;
    }
    searchText = text.obs;
    details.forEach((data) {
      if (data.name.toLowerCase().contains(text.toLowerCase()))
        searchResult.add(data);
    });
    print("searchResult $searchResult");
  }
}

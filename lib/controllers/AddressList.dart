import 'package:get/state_manager.dart';
import 'package:tooth/models/AddressList.dart';
import 'package:tooth/services/api.service.dart';

class AddressListController extends GetxController {
  var addressList = List<Address>.empty().obs;
  var isSelected = List<bool>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddressList();
  }

  void fetchAddressList() async {
    try {
      isLoading(true);
      var address = await ApiServices.fetchAddressList();
      if (address != null) {
        addressList.value = address;
        isSelected.value = List<bool>.filled(address.length, false).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}

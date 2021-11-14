import 'package:get/state_manager.dart';
import 'package:tooth/models/Schedule.dart';
import 'package:tooth/services/api.service.dart';

class ScheduleController extends GetxController {
  var schedulesList = List<Schedule>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSchedules();
  }

  Future fetchSchedules({timeFilter = ""}) async {
    try {
      isLoading(true);
      var schedules = await ApiServices.fetchSchedules(filter: timeFilter);

      if (schedules != null) {
        schedulesList.value = schedules;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> onAppointmentApprove(json) async {
    // '{"tab": "2Tab","when": "BF","days": "15"}'
    var response = await ApiServices.onAppointmentApprove(json);
    print("data $response");
    if (response["status"] == 201) {
      // return response.body; //"Successfully added";
      return response;
    } else {
      return response;
    }
  }
}

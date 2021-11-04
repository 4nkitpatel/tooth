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

  Future fetchSchedules() async {
    try {
      isLoading(true);
      var schedules = await ApiServices.fetchSchedules();
      if (schedules != null) {
        schedulesList.value = schedules;
      }
    } finally {
      isLoading(false);
    }
  }
}

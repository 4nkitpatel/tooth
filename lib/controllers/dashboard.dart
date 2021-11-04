import 'package:get/state_manager.dart';
import 'package:tooth/models/todaysApp.dart';
import 'package:tooth/services/api.service.dart';

class DashboardController extends GetxController {
  var userStats = {}.obs;
  var todaysApp = List<TodaysApp>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserStats();
    fetchTodaysApp();
  }

  Future fetchData() async {
    fetchUserStats();
    fetchTodaysApp();
  }

  void fetchUserStats() async {
    try {
      isLoading(true);
      var stats = await ApiServices.fetchUserStats();
      if (stats != null) {
        userStats.value = stats;
      }
    } finally {
      isLoading(false);
    }
  }

// TODO in this we will call appointmnet/scehdule api only just with param - today
// ? this is just a simulation
  void fetchTodaysApp() async {
    try {
      isLoading(true);
      var app = await ApiServices.fetchTodaysApp();
      if (app != null) {
        todaysApp.value = app;
      }
    } finally {
      isLoading(false);
    }
  }
}

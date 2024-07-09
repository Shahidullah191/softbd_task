import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:softbd_task/data/api/api_client.dart';
import 'package:softbd_task/utils/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

  // Repository

  //Get.lazyPut(() => OnlineApplicationRepository(apiClient: Get.find()));

  // Controller

  //Get.lazyPut(() => OnlineApplicationController(onlineApplicationRepository: Get.find()));


  // Retrieving localized data
  Map<String, Map<String, String>> di = {};

  return di;
}
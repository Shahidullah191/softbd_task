import 'package:get/get.dart';
import 'package:softbd_task/common/custom_snackbar.dart';

class ApiChecker {
  static void checkApi(Response response, {bool showToaster = true}) {
    if(response.statusCode != 200) {
      showCustomSnackBar(response.body['message'], showToaster: showToaster);
    }
  }
}
import 'package:get/get.dart';
import 'package:softbd_task/helper/convert_to_bangla_numeral.dart';

class HomeController extends GetxController implements GetxService {
  late DateTime startDate;
  late DateTime endDate;

  var elapsedDuration = Duration.zero;
  var remainingDuration = Duration.zero;

  double value = 0.0;

  @override
  void onInit() {
    super.onInit();
    startDate = DateTime(2024, 1, 1);
    endDate = DateTime(2030, 1, 31);
    updateDurations();
    getValue();
  }

  void updateDurations() {
    final now = DateTime.now();
    elapsedDuration = now.isAfter(startDate) ? now.difference(startDate) : Duration.zero;
    remainingDuration = endDate.difference(now);
    update();
  }

  int get yearsPassed => elapsedDuration.inDays ~/ 365;
  int get monthsPassed => (elapsedDuration.inDays % 365) ~/ 30;
  int get daysPassed => elapsedDuration.inDays % 30;

  String get yearsPassedString => convertToBanglaNumeral(yearsPassed);
  String get monthsPassedString => convertToBanglaNumeral(monthsPassed);
  String get daysPassedString => convertToBanglaNumeral(daysPassed);

  int get yearsRemaining => remainingDuration.inDays ~/ 365;
  int get monthsRemaining => (remainingDuration.inDays % 365) ~/ 30;
  int get daysRemaining => remainingDuration.inDays % 30;

  String get yearsRemainingString => convertToBanglaNumeral(yearsRemaining).padLeft(2, '০');
  String get monthsRemainingString => convertToBanglaNumeral(monthsRemaining).padLeft(2, '০');
  String get daysRemainingString => convertToBanglaNumeral(daysRemaining).padLeft(2, '০');

  double getValue() {
    int totalDays = endDate.difference(startDate).inDays + 1;

    DateTime currentDate = DateTime.now();
    if (currentDate.isBefore(startDate)) {
      currentDate = startDate;
    }

    int daysPassed = currentDate.difference(startDate).inDays;
    value = daysPassed / totalDays;
    return value;
  }

}

import 'package:get/get.dart';
import 'package:softbd_task/data/api/api_client.dart';
import 'package:softbd_task/utils/app_constants.dart';

class TimelineRepository{
  final ApiClient apiClient;
  TimelineRepository({required this.apiClient});

  Future<Response> getTimelineData() async {
    return apiClient.getData(AppConstants.timelineUri);
  }

}
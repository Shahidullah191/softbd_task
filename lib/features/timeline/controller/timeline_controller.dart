import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbd_task/data/api/api_checker.dart';
import 'package:softbd_task/features/timeline/model/timeline_model.dart';
import 'package:softbd_task/features/timeline/repository/timeline_repository.dart';

class TimelineController extends GetxController implements GetxService {
  final TimelineRepository timelineRepository;
  TimelineController({required this.timelineRepository});

  TimelineModel? _timelineModel;
  TimelineModel? get timelineModel => _timelineModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getTimelineData() async {
    _isLoading = true;
    update();
    final response = await timelineRepository.getTimelineData();
    if(response.statusCode == 200) {
      _timelineModel = TimelineModel.fromJson(response.body);
    }else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  String? _selectedParagraphDivision;
  String? get selectedParagraphDivision => _selectedParagraphDivision;

  String? _selectedLocation;
  String? get selectedLocation => _selectedLocation;

  String? _selectedDate;
  String? get selectedDate => _selectedDate;

  void setSelectedParagraphDivision(String value) {
    _selectedParagraphDivision = value;
    update();
  }

  void setSelectedLocation(String value) {
    _selectedLocation = value;
    update();
  }

  void setSelectedDate(String value) {
    _selectedDate = value;
    update();
  }

}
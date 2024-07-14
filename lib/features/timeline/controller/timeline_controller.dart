import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbd_task/data/api/api_checker.dart';
import 'package:softbd_task/features/timeline/model/timeline_model.dart';
import 'package:softbd_task/features/timeline/repository/timeline_repository.dart';

class TimelineController extends GetxController implements GetxService {
  final TimelineRepository timelineRepository;
  TimelineController({required this.timelineRepository});

  List<Data>? _timelineDataList;
  List<Data>? get timelineDataList => _timelineDataList;

  String? _selectedParagraphDivision;
  String? get selectedParagraphDivision => _selectedParagraphDivision;

  String? _selectedLocation;
  String? get selectedLocation => _selectedLocation;

  String? _selectedDateTime;
  String? get selectedDateTime => _selectedDateTime;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  final TextEditingController _paragraphController = TextEditingController();
  TextEditingController get paragraphController => _paragraphController;

  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onClose() {
    super.onClose();
    // Clean up the controller when the widget is disposed
    _timelineDataList = null;
    _selectedParagraphDivision = null;
    _selectedLocation = null;
    _selectedDate = null;
    _isLoading = false;
  }

  Future<void> getTimelineData({String? date}) async {
    _isLoading = true;
    update();
    final response = await timelineRepository.getTimelineData();
    if(response.statusCode == 200) {

      _timelineDataList = [];

      if(date != null) {
        _timelineDataList?.addAll(response.body['data'].where((data) => data['date'] == date).map<Data>((data) => Data.fromJson(data)).toList());
      }else {
        _timelineDataList?.addAll(response.body['data'].map<Data>((data) => Data.fromJson(data)).toList());
      }

    }else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }


  void setSelectedParagraphDivision(String value) {
    _selectedParagraphDivision = value;
    update();
  }

  void setSelectedLocation(String value) {
    _selectedLocation = value;
    update();
  }

  void setSelectedDateTime(String value) {
    _selectedDateTime = value;
    update();
  }

  Future<void> setSelectedDate(DateTime date) async {
    _selectedDate = date;

    DateTime dateTime = date;
    int timestamp = dateTime.millisecondsSinceEpoch ~/ 1000;

    await getTimelineData(date: timestamp.toString());
    update();
  }

  void setCurrentDate(DateTime date){
    _selectedDate = date;
    update();
  }

  void dataClear(){
    _paragraphController.clear();
    _descriptionController.clear();
    _selectedParagraphDivision = null;
    _selectedLocation = null;
    _selectedDate = null;
  }

}

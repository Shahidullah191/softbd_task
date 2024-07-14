import 'package:softbd_task/helper/convert_to_bangla_numeral.dart';

class TimelineModel {
  List<Data>? data;

  TimelineModel({this.data});

  TimelineModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? date;
  String? name;
  String? category;
  String? location;

  Data({this.date, this.name, this.category, this.location});

  Data.fromJson(Map<String, dynamic> json) {
    // Convert the date if it's a Unix timestamp
    if (json['date'] != null) {
      int timestamp = int.parse(json['date']);
      date = formatTimestampWithPrefix(timestamp);
    }
    name = json['name'];
    category = json['category'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['name'] = name;
    data['category'] = category;
    data['location'] = location;
    return data;
  }

  String formatTimestampWithPrefix(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String period;

    if (dateTime.hour < 6) {
      period = 'রাত';
    } else if (dateTime.hour < 12) {
      period = 'সকাল';
    } else if (dateTime.hour < 18) {
      period = 'দুপুর';
    } else {
      period = 'রাত';
    }

    int hour = dateTime.hour % 12;
    hour = hour == 0 ? 12 : hour;

    String minute = dateTime.minute.toString().padLeft(2, '0');

    // Convert the hour and minute to Bangla format
    String banglaHour = convertToBanglaNumeral(hour).padLeft(2, '০');
    String banglaMinute = convertToBanglaNumeral(int.parse(minute)).padLeft(2, '০');

    return '$period $banglaHour:$banglaMinute মি.';
  }
}

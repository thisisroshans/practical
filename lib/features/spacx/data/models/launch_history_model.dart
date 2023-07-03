import 'package:practical_tdd/features/spacx/domain/entities/launch_history.dart';

class LaunchHistoryModel extends LaunchHistory
{
  const LaunchHistoryModel({required String missionName,
  required DateTime launchDate,
  required String launchYear,}):super(missionName: missionName,launchDate: launchDate,launchYear: launchYear);

  factory LaunchHistoryModel.fromJson(Map<String,dynamic> json)
  {
    return LaunchHistoryModel(missionName: json['missionName'],
        launchDate: json['launchDate'],
        launchYear: json['launchYear'],
    );
  }
  Map<String, dynamic> toJson(){
    return{
      'missionName':missionName,
      'launchDate':launchDate,
      'launchYear':launchYear,
    };
  }
}
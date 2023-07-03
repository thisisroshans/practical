import 'package:equatable/equatable.dart';

class LaunchHistory extends Equatable{
  final String missionName;
  final DateTime launchDate;
  final String launchYear;

  const LaunchHistory({
    required this.missionName,
    required this.launchDate,
    required this.launchYear,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [missionName,launchDate,launchYear];
}

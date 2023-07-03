import '../entities/launch_history.dart';

class LaunchHistoryRepository {
  List<LaunchHistory> launchHistory = [
    LaunchHistory(
      missionName: 'FalconSat',
      launchDate: DateTime(2022, 1, 1),
      launchYear: '2006',
    ),

    // Add more launch history data as needed
  ];

  List<LaunchHistory> getLaunchHistory() {
    return launchHistory;
  }

  void addLaunchToHistory(LaunchHistory launch) {
    launchHistory.add(launch);
  }

// You can add other methods for updating, deleting, or querying launch history data
}

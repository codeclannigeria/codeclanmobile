import 'package:codeclanmobile/services/api/api_service.dart';
import 'package:codeclanmobile/services/api/models/stages_dto.dart';
import 'package:codeclanmobile/services/api/models/task_dto.dart';
import 'package:codeclanmobile/services/service_locator.dart';

class TaskRepository {
  var apiService = serviceLocator<ApiService>();
  Future<Task> getAllTasks() async {
    final task = await apiService.getTasks();
    return task;
  }

  Future<StagesDto> getTrackStages(String trackId) async {
    final stages = await apiService.getTrackStages(trackId);
    return stages;
  }
}

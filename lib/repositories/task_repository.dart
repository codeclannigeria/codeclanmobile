import 'package:codeclanmobile/services/api/api_service.dart';
import 'package:codeclanmobile/services/api/models/task_dto.dart';
import 'package:codeclanmobile/services/service_locator.dart';

class TaskRepository {
  var apiService = serviceLocator<ApiService>();
  Future<Task> getAllTasks() async {
    final task = await apiService.getTasks();
    return task;
  }
}

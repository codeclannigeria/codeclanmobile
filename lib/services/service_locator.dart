import 'package:codeclanmobile/services/api/api_service.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;
Future setupLocator() async {
  serviceLocator.registerSingleton<ApiService>(new ApiService());
}

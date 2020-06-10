import 'package:codeclanmobile/repositories/rest_client.dart';
import 'package:flutter/material.dart';

class ApiRepository {
  final RestClient restClient;

  ApiRepository({@required this.restClient}) : assert(restClient != null);
}
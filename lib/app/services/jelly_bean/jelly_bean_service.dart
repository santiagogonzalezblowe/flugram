import 'dart:convert';

import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_response_model.dart';
import 'package:http/http.dart' as http;

class JellyBeanService {
  JellyBeanService();

  static const String _baseUrl =
      'https://jellybellywikiapi.onrender.com/api/Beans';

  Future<JellyBeansResponseModel> loadJellyBeans(int page) async {
    final finalPage = page + 1;

    final url = Uri.parse('$_baseUrl?pageIndex=$finalPage&pageSize=10');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body) as Map<String, dynamic>;

      return JellyBeansResponseModel.fromJson(map);
    } else {
      throw Exception('Failed to load jelly beans');
    }
  }

  Future<JellyBeansResponseModel> loadJellyBeansByGroupName(
    int page,
    String groupName,
  ) async {
    final finalPage = page + 1;

    final url = Uri.parse(
      '$_baseUrl?groupName=$groupName&pageIndex=$finalPage&pageSize=10',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body) as Map<String, dynamic>;

      return JellyBeansResponseModel.fromJson(map);
    } else {
      throw Exception('Failed to load jelly beans by group name: $groupName');
    }
  }

  Future<JellyBeanModel> loadJellyBean(int id) async {
    final url = Uri.parse('$_baseUrl/$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body) as Map<String, dynamic>;

      return JellyBeanModel.fromJson(map);
    } else {
      throw Exception('Failed to load jelly bean $id');
    }
  }
}

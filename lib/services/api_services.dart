import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:chatgpt/models/models_model.dart';
import 'package:http/http.dart' as http;
import '../constants/api_const.dart';

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      // print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        // log("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapShot(temp);
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }
}

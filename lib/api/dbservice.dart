import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lift/constants/constantManager.dart';

Future<dynamic> getDataFromApi() async {
  try {
    final response = await http.get(Uri.parse(AppStrings.apiUrl));
    if (response.statusCode == 200) {
      // print(response.body);
      return json.decode(response.body);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

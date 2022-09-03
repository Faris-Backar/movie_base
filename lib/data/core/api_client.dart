import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_base/data/core/api_constants.dart';

class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get({
    required String path,
    Map<dynamic, dynamic>? params,
  }) async {
    final linkUrl =
        '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}';
    Uri url = Uri.parse(linkUrl);

    const headers = {'Content-Type': 'application/json'};
    final response = await _client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String getpath({String? path, Map<dynamic, dynamic>? params}) {
    var paramString = '';
    if (params!.isNotEmpty) {
      params.forEach((key, value) {
        paramString += '&$key=$value';
      });
    }
    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramString';
  }
}

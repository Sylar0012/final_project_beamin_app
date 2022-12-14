import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final httpConnector = Provider<HttpConnector>((ref) {
  return HttpConnector();
});

class HttpConnector {
  final host = "http://192.168.0.5:8080";
  final headers = {"Content-Type": "application/json; charset=utf-8"};
  final Client _client = Client();

  Future<Response> getInitSession(String path, String? jwtToken) async {
    Map<String, String> requestHeader = {...headers, "Authorization": jwtToken!};
    Uri uri = Uri.parse("${host}${path}");
    Response response = await Client().get(uri, headers: requestHeader);
    return response;
  }

  Future<Response> get(String path) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.get(uri);
    return response;
  }

  Future<Response> delete(String path) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.delete(uri);
    return response;
  }

  Future<Response> put(String path, String body, String? jwtToken) async {
    Map<String, String> requestHeader = {...headers, "Authorization": jwtToken!};
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.put(uri, body: body, headers: requestHeader);
    return response;
  }

  Future<Response> post(String path, String body) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.post(uri, body: body, headers: headers);
    return response;
  }

  Future<Response> postInitSession(String path, String body, String? jwtToken) async {
    Map<String, String> requestHeader = {...headers, "Authorization": jwtToken!};
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.post(uri, body: body, headers: requestHeader);
    return response;
  }
}

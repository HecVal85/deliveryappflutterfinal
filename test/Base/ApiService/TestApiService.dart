import 'package:deliveryappflutter/src/Base/ApiService/ApiService.dart';
import 'package:flutter_test/flutter_test.dart';

import 'Mocks/TestApiMocks.dart';

abstract class _Constants {
  static Map<String, String> defaultHeaders = { 'Content-type': 'application/json; charset=UTF-8' };
  static String postEndpoint = "https://jsonplaceholder.typicode.com/posts";
  static String getEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
  static String putEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
}

void main() {
  final ApiService _testApiService = DefaultApiService();

  group('Test Correct Connection of Api Service', () {
    //Test de conexión del POST
    test('Teste correct post conection to jsonplaceholder', () async {
    final bodyParams = CorrectPostBodyParams(title: 'foo', body: 'bar', userId: 1);
    final result = await _testApiService.getDataFromPostRequest (bodyParameters: bodyParams.toMap(), url: _Constants.postEndpoint, headers: _Constants.defaultHeaders);
    
    expect(result, Map.from(result));
    });
    //Test de conexión del GET
    test('Test correct get to json placeholder', () async {
      final result = await _testApiService.getDataFromGetRequest(url: _Constants.getEndpoint);

      expect(result, Map.from(result));
    });
    //Test de conexión del PUT
    test('Test correct put connection  to json placeholder', () async {
      //final result = await _testApiService.getDataFromGetRequest(url: _Constants.putEndpoint);
      final body = CorrectPutBodyParams(id: 1, title: 'foo', body: 'bar', userId: 1 );
      final result = await _testApiService.getDataFromPutRequest(bodyParameters: body.toMap(), url: _Constants.putEndpoint, headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });
  });
}

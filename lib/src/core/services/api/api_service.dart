import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hrms_app/src/core/constants/constant.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = Constant.domain;

  // Method for handling GET, POST, PUT, DELETE requests
  Future<Map<String, dynamic>> request({
    required String endpoint,
    required String method, // Method can be 'GET', 'POST', 'PUT', 'DELETE'
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
  }) async {
    // Create the full URL with query parameters if provided
    Uri uri =
        Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams);

    http.Response response;

    try {
      // Switch statement for handling different HTTP methods
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(uri, headers: headers);
          break;
        case 'POST':
          response = await http.post(
            uri,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case 'PUT':
          response = await http.put(
            uri,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case 'DELETE':
          response = await http.delete(uri, headers: headers);
          break;
        default:
          throw Exception('HTTP method $method is not supported');
      }

      if (kDebugMode) {
        print("Status Code: ${response.statusCode}");
      }

      // Checking if the request was successful
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {
          'success': true,
          'data': jsonDecode(response.body), // Return decoded JSON response
        };
      } else {
        return {
          'success': false,
          // 'error':
          //     'Failed request: ${response.statusCode}, body: ${response.body}',
          'data': jsonDecode(response.body),
        };
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error occurred: $error');
      }
      return {
        'success': false,
        'error': error.toString(),
      };
    }
  }
}

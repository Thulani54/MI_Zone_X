import 'dart:convert';

import 'package:http/http.dart' as http;

class CoronaService {
  final String baseUrl = "https://api.covid19api.com";

  // Gets the summary of global and country-wise COVID-19 data
  Future<dynamic> getSouthAfricaLive() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/summary'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  // Fetches real-time data for South Africa
  Future<dynamic> getCoronaRealData(String country) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/live/country/$country'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  // Gets total COVID-19 data for South Africa
  Future<dynamic> getTotal() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/total/country/south-africa'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}

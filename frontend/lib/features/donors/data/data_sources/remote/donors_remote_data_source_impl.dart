import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../exceptions/server_exception.dart';
import '../../models/donors_age_by_blood_type_model.dart';
import '../../models/donors_by_age_model.dart';
import '../../models/donors_by_state_model.dart';
import '../../models/donors_obesity_by_gender_model.dart';
import '../../models/possible_donors_by_blood_type_model.dart';
import 'donors_remote_data_source.dart';

class DonorsRemoteDataSourceImpl implements DonorsRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  const DonorsRemoteDataSourceImpl({
    required this.client,
    this.baseUrl = 'https://example.com/donors',
  });

  Future<List<Map<String, dynamic>>> getDonorsData() async {
    final String response = await rootBundle.loadString('assets/donors.json');
    final List<Map<String, dynamic>> data = jsonDecode(response);
    return data;
  }

  @override
  Future<void> syncDonors() async {
    final body = await getDonorsData();

    final url = Uri.parse(baseUrl);

    final response = await client.put(url, body: jsonEncode(body));

    if (response.statusCode != 200) {
      throw ServerException(
        statusCode: response.statusCode,
        message: 'Failed sync donors',
        url: url.toString(),
        responseBody: response.body,
      );
    }
  }

  @override
  Future<List<DonorsAgeByBloodTypeModel>> getDonorsAgeByType() async {
    final url = Uri.parse(
      '$baseUrl/statistics/age-by-blood-type',
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body) as List<Map<String, dynamic>>;
      return jsonMap
          .map((json) => DonorsAgeByBloodTypeModel.fromJson(json))
          .toList();
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: 'Failed to fetch donors data',
        url: url.toString(),
        responseBody: response.body,
      );
    }
  }

  @override
  Future<List<DonorsByAgeModel>> getDonorsByAge() async {
    final url = Uri.parse(
      '$baseUrl/statistics/age',
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body) as List<Map<String, dynamic>>;
      return jsonMap.map((json) => DonorsByAgeModel.fromJson(json)).toList();
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: 'Failed to fetch donors data',
        url: url.toString(),
        responseBody: response.body,
      );
    }
  }

  @override
  Future<List<DonorsByStateModel>> getDonorsByState() async {
    final url = Uri.parse(
      '$baseUrl/statistics/state',
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body) as List<Map<String, dynamic>>;
      return jsonMap.map((json) => DonorsByStateModel.fromJson(json)).toList();
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: 'Failed to fetch donors data',
        url: url.toString(),
        responseBody: response.body,
      );
    }
  }

  @override
  Future<List<DonorsObesityByGenderModel>> getObesityByGender() async {
    final url = Uri.parse(
      '$baseUrl/statistics/obesity-by-gender',
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body) as List<Map<String, dynamic>>;
      return jsonMap
          .map((json) => DonorsObesityByGenderModel.fromJson(json))
          .toList();
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: 'Failed to fetch donors data',
        url: url.toString(),
        responseBody: response.body,
      );
    }
  }

  @override
  Future<List<PossibleDonorsByBloodTypeModel>> getPossibleDonors() async {
    final url = Uri.parse(
      '$baseUrl/statistics/possible-donors-by-blood-type',
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body) as List<Map<String, dynamic>>;
      return jsonMap
          .map((json) => PossibleDonorsByBloodTypeModel.fromJson(json))
          .toList();
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: 'Failed to fetch donors data',
        url: url.toString(),
        responseBody: response.body,
      );
    }
  }
}

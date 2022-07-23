import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:funda_assignment/src/infrastructure/models/failure.dart';
import 'package:funda_assignment/src/infrastructure/models/object_detail.dart';
import 'package:funda_assignment/src/infrastructure/models/search_response.dart';

/// Responsible for all interactions with the Funda api.
class DataController {
  DataController([Dio? apiClient]) : _apiClient = apiClient ?? Dio();

  static const _apiKey = 'ac1b0b1572524640a0ecc54de453ea9f';
  static const _baseUrl = 'http://partnerapi.funda.nl';

  final Dio _apiClient;

  Future<Either<Failure, SearchResponse>> search(String term) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '$_baseUrl/feeds/Aanbod.svc/json/$_apiKey/',
        queryParameters: {
          'type': 'koop',
          'zo': '/$term/+10km/',
        },
      );

      if (response.data == null) {
        return left(const Failure(FailureType.unknown, 'No data returned.'));
      }

      final model = SearchResponse.fromJson(response.data!);
      return right(model);
    } on DioError {
      return left(const Failure(FailureType.unknown, 'Unknown error'));
    }
  }

  Future<Either<Failure, ObjectDetail>> fetchObject(String id) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '$_baseUrl/feeds/Aanbod.svc/json/detail/$_apiKey/koop/$id/',
      );

      if (response.data == null) {
        return left(const Failure(FailureType.unknown, 'No data returned.'));
      }

      final model = ObjectDetail.fromJson(response.data!);
      return right(model);
    } on DioError {
      return left(const Failure(FailureType.unknown, 'Unknown error'));
    }
  }
}

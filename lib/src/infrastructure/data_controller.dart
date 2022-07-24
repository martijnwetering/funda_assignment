import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:funda_assignment/src/infrastructure/models/failure.dart';
import 'package:funda_assignment/src/infrastructure/models/object_detail.dart';
import 'package:funda_assignment/src/infrastructure/models/search_response.dart';

/// Responsible for all interactions with the Funda partner API.
///
/// All methods return an [Either] where [Either.left] is a [Failure] and
/// [Either.right] is the result of the API call. This forces the call site
/// to handle all possible cases. If errors where handled by throwing the
/// caller could forget to wrap the call in a try/catch block and handle the
/// appropriate error.
///
/// Results can be extracted by using [Either.match].
/// ```dart
/// apiResult.match(
///   (error) { // handle error },
///   (result) { // handle data },
/// );
/// ```
///
/// A [Dio] api client can be optionally passed in to setup testing. If one is
/// not provided the [DataController] will create it's own [Dio] instance.
class DataController {
  DataController([Dio? apiClient]) : _apiClient = apiClient ?? Dio();

  static const _apiKey = 'ac1b0b1572524640a0ecc54de453ea9f';
  static const _baseUrl = 'http://partnerapi.funda.nl';

  final Dio _apiClient;

  /// Performs a search request against the Funda partner API.
  Future<Either<Failure, SearchResponse>> search(String term) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '$_baseUrl/feeds/Aanbod.svc/json/$_apiKey/',
        queryParameters: {
          'type': 'koop',
          'zo': '/${term.toLowerCase()}/+10km/',
        },
      );

      if (response.data == null) {
        return left(const Failure.noData());
      }

      final model = SearchResponse.fromJson(response.data!);
      return right(model);
    } on DioError {
      return left(const Failure.unknown());
    }
  }

  /// Gets the details of a specific object found via [search].
  Future<Either<Failure, ObjectDetail>> fetchObject(String id) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '$_baseUrl/feeds/Aanbod.svc/json/detail/$_apiKey/koop/$id/',
      );

      if (response.data == null) {
        return left(const Failure.noData());
      }

      final model = ObjectDetail.fromJson(response.data!);
      return right(model);
    } on DioError {
      return left(const Failure.unknown());
    }
  }
}

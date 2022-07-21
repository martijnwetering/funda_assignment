import 'package:flutter/foundation.dart';

/// Reason why an api request failed.
enum FailureType {
  badRequest,
  serverError,
  insufficientPermission,
  unknown,
}

/// Contains information about a failed api requests.
@immutable
class Failure {
  const Failure(this.failureType, this.message);

  final FailureType failureType;
  final String message;
}

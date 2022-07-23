import 'package:flutter/foundation.dart';

/// Contains information about a failed api requests.
@immutable
class Failure {
  const Failure([this.message = '']);

  const Failure.noData() : this('Response contained no data.');
  const Failure.unknown() : this('Unknown error.');

  final String message;
}

import 'package:meta/meta.dart';

class Response {
  final bool success;
  final String message;
  final Map<String, dynamic> data;
  Response({
    @required this.success,
    @required this.message,
    this.data,
  });

  static final defaultFailMessage = 'Something went wrong.';
  static final fieldsErrorMessage =
      'Please make sure all fields have been entered correctly.';
}

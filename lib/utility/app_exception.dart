class AppExection implements Exception {
  final _message;
  final _prefix;

  AppExection([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchExection extends AppExection {
  FetchExection([String? message]) : super(message, '');
}
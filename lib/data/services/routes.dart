class Routes {
  static String getCategories = '058729bd-1402-4578-88de-265481fd7d54';
}

class ApiConfig {
  static const _protocol = 'https://';
  static const _domain = 'run.mocky.io/';
  static const _version = 'v3/';

  static String generateRoute(String method) {
    return _protocol + _domain + _version + method;
  }
}

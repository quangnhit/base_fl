class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': Locales.en,
    'vi': Locales.vi,
  };
}

class LocaleKeys {
  LocaleKeys._();
  static const sign_in = 'sign_in';
  static const sign_up = 'sign_up';
}

class Locales {
  static const en = {
    'sign_in': 'Đăng nhập',
    'sign_up': 'Đăng kí',
  };
  static const vi = {
    'sign_in': 'Đăng nhập',
    'sign_up': 'Đăng kí',
  };
}

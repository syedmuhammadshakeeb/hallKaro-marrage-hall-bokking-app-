import 'package:flutter/widgets.dart';

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (this == '') {
      return '';
    }
    return this[0].toUpperCase() + substring(1);
  }
}


extension UniqueAddAll<T> on List<T> {
  void addAllIfNotExists(Iterable<T> items) {
    for (var item in items) {
      if (!contains(item)) {
        add(item);
      }
    }
  }
    void addIfNotExists(T item) {
    if (!contains(item)) add(item);
  }
}


extension BuildContextX on BuildContext {
  bool get isArabicLocale => currentLocale.languageCode == 'ar';

  Locale get currentLocale => Localizations.localeOf(this);

  bool get isRightDirectionality =>
      Directionality.of(this) == TextDirection.rtl;

  double get getWidth => MediaQuery.of(this).size.width;
  double get getHeight =>
      MediaQuery.of(this).size.height - MediaQuery.of(this).padding.bottom;

  double get bottomPadding => MediaQuery.of(this).viewInsets.bottom;
}

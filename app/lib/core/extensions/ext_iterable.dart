import 'package:flutter/cupertino.dart';

extension ExtIterable<T> on Iterable<T> {
  Iterable<R> mapOrSkipExt<R>(R Function(T target) transform) sync* {
    for (final current in this) {
      try {
        yield transform(current);
      } catch (e) {
        debugPrint("Item $current skipped on map. Reason: $e");
        continue;
      }
    }
  }
}

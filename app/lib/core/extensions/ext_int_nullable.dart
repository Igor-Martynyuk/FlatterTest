enum EpochUnit { micros, millis }

extension ExtIntNullable on int? {
  DateTime? toDateOrNullExt(EpochUnit unit) {
    try {
      if (unit == EpochUnit.micros) {
        return DateTime.fromMicrosecondsSinceEpoch(this!);
      } else {
        return DateTime.fromMillisecondsSinceEpoch(this!);
      }
    } catch (_) {
      return null;
    }
  }
}

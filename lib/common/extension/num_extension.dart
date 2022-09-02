extension NumExtension on num {
  String covertToPercentageString() {
    return '${(this * 10).toStringAsFixed(0)} %';
  }
}

/// Supported barcode types
enum MyBarcodeType {
  code128,
  code39,
  code93,
  codebar,
  dataMatrix,
  ean13,
  ean8,
  itf,
  qrCode,
  upcA,
  upcE,
  pdf417,
  aztec,
  unknown, // we will set as qrCode
}

extension MyBarcodeTypeParser on MyBarcodeType {
  String value() {
    return toString().split('.').last;
  }

  static MyBarcodeType fromString(String event) {
    return MyBarcodeType.values
        .firstWhere((element) => element.value() == event);
  }
}

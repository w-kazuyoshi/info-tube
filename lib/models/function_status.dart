import 'dart:async';

class FunctionStatus {
  bool _isEnableExtension = false;
  bool _clockIsValid = false;
  bool _informationIsValid = false;

  // define StreamController with "broadcast()"" especially for Web
  final _isEnableExtensionController = StreamController<bool>.broadcast();
  final _clockIsValidController = StreamController<bool>.broadcast();
  final _informationIsValidController = StreamController<bool>.broadcast();

  // define Stream's getter
  Stream<bool> get isEnableExtensionStream =>
      _isEnableExtensionController.stream;
  Stream<bool> get clockIsValidStream => _clockIsValidController.stream;
  Stream<bool> get informationIsValidStream =>
      _informationIsValidController.stream;

  // define status's setter
  set isEnableExtension(bool value) {
    _isEnableExtension = value;
    _isEnableExtensionController.add(value);
  }

  set clockIsValid(bool value) {
    _clockIsValid = value;
    _clockIsValidController.add(value);
  }

  set informationIsValid(bool value) {
    _informationIsValid = value;
    _informationIsValidController.add(value);
  }

  // define status's getter
  bool get isEnableExtension => _isEnableExtension;
  bool get clockIsValid => _clockIsValid;
  bool get informationIsValid => _informationIsValid;

  void dispose() {
    _isEnableExtensionController.close();
    _informationIsValidController.close();
    _informationIsValidController.close();
  }
}

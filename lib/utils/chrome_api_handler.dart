@JS()
library chrome_api;

import 'package:js/js.dart';

@JS('isEnableExtension')
external bool isEnableExtension();

@JS('isTrueFromStorageLocal')
external bool isTrueFromStorageLocal(String key);

@JS('setStorageLocal')
external Object setStorageLocal(String key, String value);

@JS('reloadTab')
external Object reloadTab();

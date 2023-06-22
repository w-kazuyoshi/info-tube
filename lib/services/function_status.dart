// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util';

import '../utils/chrome_api_handler.dart';

Future<bool> fetchIsEnableExtension() async {
  try {
    final response = await promiseToFuture(isEnableExtension());

    if (response) {
      return response;
    }

    return false;
  } catch (error) {
    return false;
  }
}

Future<bool> fetchSavedData(String key) async {
  try {
    final response = await promiseToFuture(isTrueFromStorageLocal(key));

    if (response) {
      return response;
    }

    return false;
  } catch (error) {
    return false;
  }
}

Future<void> registerData(String key, String value) async {
  try {
    await promiseToFuture(setStorageLocal(key, value));
    return;
  } catch (error) {
    return;
  }
}

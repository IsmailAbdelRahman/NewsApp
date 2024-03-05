import 'package:shared_preferences/shared_preferences.dart';

class SPreferences {
  static SharedPreferences? sPrefernces;

  static Future iNitialSPreferen() async {
    return sPrefernces = await SharedPreferences.getInstance();
  }

  static bool? getData({required key}) {
    return sPrefernces!.getBool(key);
  }

  static Future<bool> putData({required key, required value}) async {
    return await sPrefernces!.setBool(key, value);
  }

  //dynamic //string
}

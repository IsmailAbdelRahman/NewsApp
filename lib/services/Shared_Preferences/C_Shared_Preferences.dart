
import 'package:shared_preferences/shared_preferences.dart';






class Sh_Preferences{

 static SharedPreferences ? sh_Prefernces ;

 static  Future INitial_Sh_preferen()async {

    return sh_Prefernces=  await SharedPreferences.getInstance();
  }

 static bool? getData( {required  key } ) {
  return  sh_Prefernces!.getBool(key);
 }

 static Future<bool> PutData({ required key , required value}) async {

  return await  sh_Prefernces!.setBool(key, value);
  }

                    //dynamic //string





}


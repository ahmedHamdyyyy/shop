


 import 'package:shared_preferences/shared_preferences.dart';

 class CachHealper
 {
   static SharedPreferences? sharedPreferences;
   static init() async
   {
     sharedPreferences=await SharedPreferences.getInstance();
   }
   static Future<bool> putBoll({
     required bool value,
     required String key,
   })async
   {
     return await sharedPreferences!.setBool(key, value);
   }
   static bool? getDBoollen({
     required String key,
   })
   {
     return  sharedPreferences!.getBool(key);
   }
 }

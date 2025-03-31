import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storeUserDetails = prefs.getString("UserName");
    return (storeUserDetails ?? "");
  }

  Future<bool> setUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("userName", name);
  }

  Future<void> saveUserDetails(String name, String email, String age,
      String height, String weight, String gender, String pass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('token', age); // Store auth token if needed
    await prefs.setString('token', height);
    await prefs.setString('token', weight);
    await prefs.setString('token', gender);
    await prefs.setString('token', pass);
  }
}

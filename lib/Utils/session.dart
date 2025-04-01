import 'dart:convert';

import 'package:myfitnessapp/Models/user_data.dart';
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

  Future<void> saveUserDetails(UserData user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', user.name);
    await prefs.setString('email', user.email);
    await prefs.setInt('age', user.age); // Storing as an integer
    await prefs.setDouble('height', user.height); // Storing as a double
    await prefs.setDouble('weight', user.weight); // Storing as a double
    await prefs.setString('gender', user.gender);
    await prefs.setString('pass', user.pass); // Consider encrypting this
  }

  Future<UserData> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    int? age = prefs.getInt('age'); // Store as an integer if applicable
    double? height = prefs.getDouble('height'); // Store as a double
    double? weight = prefs.getDouble('weight'); // Store as a double
    String? gender = prefs.getString('gender');
    String? pass = prefs.getString('pass');

    return UserData(
      name: name ?? '',
      email: email ?? '',
      age: age ?? 0, // Defaulting to 0 if not found
      height: height ?? 0.0, // Defaulting to 0.0 if not found
      weight: weight ?? 0.0, // Defaulting to 0.0 if not found
      gender: gender ?? '',
      pass: pass ?? '',
    );
  }

  Future<void> saveUserData(UserData user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString('user_data', userJson);
  }

  Future<UserData?> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_data');

    if (userJson == null) return null;
    return UserData.fromJson(jsonDecode(userJson));
  }
}

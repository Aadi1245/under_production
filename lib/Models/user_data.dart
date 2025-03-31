class UserData {
  String? name;
  String? email;
  String? age;
  String? height;
  String? weight;
  String? gender;
  String? pass;

  UserData({
    this.name,
    this.email,
    this.age,
    this.height,
    this.weight,
    this.gender,
    this.pass,
  });

  // Convert UserData object to JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'pass': pass,
    };
  }

  // Create UserData object from JSON (Map)
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      gender: json['gender'],
      pass: json['pass'],
    );
  }
}

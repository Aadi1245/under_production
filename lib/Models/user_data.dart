class UserData {
  String name;
  String email;
  int age;
  double height;
  double weight;
  String gender;
  String pass;

  UserData({
    required this.name,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
    required this.pass,
  });

  // Convert object to Map for easy storage
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'age': age,
        'height': height,
        'weight': weight,
        'gender': gender,
        'pass': pass, // Consider encrypting
      };

  // Factory method to create UserData from JSON
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      age: json['age'] ?? 0,
      height: (json['height'] ?? 0.0).toDouble(),
      weight: (json['weight'] ?? 0.0).toDouble(),
      gender: json['gender'] ?? '',
      pass: json['pass'] ?? '',
    );
  }
}

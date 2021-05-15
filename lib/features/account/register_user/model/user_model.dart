class UserModel {
  late String name, email, password, role;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();

    map['name'] = this.name;
    map['role'] = this.role;
    map['email'] = this.email;
    map['password'] = this.password;

    return map;
  }

  UserModel.fromMap(Map<dynamic, dynamic> map)
      : this.name = map['name'],
        this.role = map['role'],
        this.password = map['password'],
        this.email = map['email'];
}

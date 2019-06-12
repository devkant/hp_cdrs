class LoginModel {
  final String name;
  final String username;
  final String  resetPasswordToken;
  final DateTime  resetPasswordExpires;
  final String email;
  final int mobile;
  final String role;
  final String district;
  final String block;
  final String gender;
  final int age;
  final int next_appl;
  final String next_name;
  final String next_address;
  final String authToken;

  LoginModel(
    this.name,
    this.username,
    this.resetPasswordToken,
    this.resetPasswordExpires,
    this.email,
    this.mobile,
    this.role,
    this.district,
    this.block,
    this.gender,
    this.age,
    this.next_appl,
    this.next_name,
    this.next_address,
    this.authToken
  );

  LoginModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        username = json['username'],
        resetPasswordToken  = json['resetPasswordToken'],
        resetPasswordExpires  = json['resetPasswordExpires'],
        email = json['email'],
        mobile  = json['mobile'],
        role  = json['role'],
        district  = json['district'],
        block = json['block'],
        gender  = json['gender'],
        age = json['age'],
        next_appl = json['next_appl'],
        next_name = json['next_name'],
        next_address  = json['next_address'],
        authToken = json['authToken'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'username': username,
        'resetPassword': resetPasswordToken,
        'resetPasswordExpires': resetPasswordExpires,
        'email':  email,
        'mobile': mobile,
        'role'  : role,
        'district': district,
        'block' : block,
        'gender'  : gender,
        'age' : age,
        'next_appl' : next_appl,
        'next_name' : next_name,
        'next_address'  :next_address,
        'authToken' : authToken
      };
}
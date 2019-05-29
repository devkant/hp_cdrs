class LoginModel {
  final String userName;
  final String token;
  final int userId;

  LoginModel(this.userName, this.token, this.userId);

  LoginModel.fromJson(Map<String, dynamic> json)
      : userName = json['name'],
        token = json['token'],
        userId = json['pk'];

  Map<String, dynamic> toJson() =>
      {
        'name': userName,
        'token': token,
        'pk': userId,
      };
}
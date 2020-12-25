class LoginData {
  String email;
  String password;

  LoginData({
    this.email = '',
    this.password = '',
  });

  @override
  String toString() {
    return '''email: $email
    password: $password''';
  }
}

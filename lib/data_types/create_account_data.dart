class CreateAccountData {
  String email;
  String password;
  String firstName;
  String lastName;
  var birthDate;
  CreateAccountData({
    this.email = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.birthDate = '',
  });

  @override
  String toString() {
    return '''email: $email
    password: $password''';
  }
}

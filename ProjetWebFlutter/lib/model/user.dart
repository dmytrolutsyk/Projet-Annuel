class User {
  final String username;
  final String password;
  final String ville;
  final String email;
  final String status_user;
  final String phone;

  User(this.username, this.password, this.ville,this.email, this.status_user ,this.phone) ;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json["username"],
        json["password"],
        json["email"],
        json["ville"],
        json["status_user"],
        json["phone"],
    );
  }
}
 class Persons {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  Persons(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone});

  Persons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
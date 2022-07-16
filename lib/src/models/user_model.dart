// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

class Usuario {
  String? iduser;
  String? email;
  String? displayName;
  String? direction;
  String? phone;
  int? age;

  Usuario(
      {this.iduser,
      this.email,
      this.displayName,
      this.direction,
      this.phone,
      this.age});

  // receiving data from server
  factory Usuario.fromMap(map) {
    return Usuario(
      iduser: map['iduser'],
      email: map['email'],
      displayName: map['displayName'],
      direction: map['direction'],
      phone: map['phone'],
      age: map['age'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'iduser': iduser,
      'email': email,
      'displayName': displayName,
      'direction': direction,
      'phone': phone,
      'age': age,
    };
  }
}

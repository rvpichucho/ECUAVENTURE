// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

class Usuario {
  String? uid;
  String? email;
  String? displayName;
  String? direccion;
  String? telefono;
  int? edad;

  Usuario(
      {this.uid,
      this.email,
      this.displayName,
      this.direccion,
      this.telefono,
      this.edad});

  // receiving data from server
  factory Usuario.fromMap(map) {
    return Usuario(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
      direccion: map['direccion'],
      telefono: map['telefono'],
      edad: map['edad'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'direccion': direccion,
      'telefono': telefono,
      'edad': edad,
    };
  }
}

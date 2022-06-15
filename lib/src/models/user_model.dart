// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

class Usuario {
  String? uid;
  String? email;
  String? displayName;

  Usuario({this.uid, this.email, this.displayName});

  // receiving data from server
  factory Usuario.fromMap(map) {
    return Usuario(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
    };
  }
}
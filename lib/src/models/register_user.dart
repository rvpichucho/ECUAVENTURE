// To parse this JSON data, do
//
//     final registerUser = registerUserFromJson(jsonString);

import 'dart:convert';

RegisterUser registerUserFromJson(String str) => RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
    RegisterUser({
        this.name,
        this.surname,
        this.email,
        this.password,
        this.phoneNumber,
        this.direction,
    });

    String? name;
    String? surname;
    String? email;
    String? password;
    String? phoneNumber;
    String? direction;

    factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        direction: json["direction"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "direction": direction,
    };
}
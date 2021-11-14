// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

class Client {
  String id;
  String name;
  String email;
  String phone;
  String? country;
  String? city;
  String? token;
  bool? state;
  double? wallet;

  Client(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.country,
      this.city,
      this.token,
      this.state,
      this.wallet});

  Client clientFromJson(String str) => Client.fromJson(json.decode(str));

  String clientToJson(Client data) => json.encode(data.toJson());

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        country: json["country"],
        city: json["city"],
        token: json["token"],
        state: json["state"],
        wallet: json["wallet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "country": country,
        "city": city,
        "token": token,
        "state": state,
        "wallet": wallet,
      };
}

import 'dart:convert';

DefaultResponse defaultResponseFromJson(String str) =>
    DefaultResponse.fromJson(json.decode(str));

String defaultResponseToJson(DefaultResponse data) =>
    json.encode(data.toJson());

class DefaultResponse {
  DefaultResponse({
    required this.resp,
    required this.message,
  });

  bool resp;
  String message;

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      DefaultResponse(
        resp: json["resp"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
      };
}

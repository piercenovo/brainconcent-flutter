class GameDetailModel {
  GameDetailModel({
    required this.time,
    required this.tap,
    required this.date,
    required this.score,
    required this.gdUser,
    required this.gdGame,
    required this.uid,
  });

  int time;
  int tap;
  DateTime date;
  double score;
  String gdUser;
  String gdGame;
  String uid;

  factory GameDetailModel.fromJson(Map<String, dynamic> json) =>
      GameDetailModel(
        time: json["time"],
        tap: json["tap"],
        date: DateTime.parse(json["date"]),
        score: json["score"].toDouble(),
        gdUser: json["gd_user"],
        gdGame: json["gd_game"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "tap": tap,
        "date": date.toIso8601String(),
        "score": score,
        "gd_user": gdUser,
        "gd_game": gdGame,
        "uid": uid,
      };
}

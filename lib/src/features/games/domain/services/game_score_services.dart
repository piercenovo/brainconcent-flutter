import 'package:brainconcent_flutter/src/features/authentication/domain/responses/default_response.dart';

abstract class GameScoreServices {
  Future<DefaultResponse> createGameScore(
      String time, String tap, String userId, String gameId);
}

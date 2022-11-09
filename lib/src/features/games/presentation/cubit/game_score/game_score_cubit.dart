// import 'package:brainconcent_flutter/src/features/games/data/models/game_score_model.dart';
// import 'package:brainconcent_flutter/src/features/games/data/services/game_score_services_impl.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'game_score_state.dart';

// class GameScoreCubit extends Cubit<GameScoreState> {
//   GameScoreCubit() : super(GameScoreInitial());

//   Future<void> registerGameScore(
//       int time, int tap, String userId, String gameId) async {
//     try {
//       emit(LoadingGameScoreState());

//       await Future.delayed(const Duration(milliseconds: 550));

//       final data =
//           await gameScoreServices.createGameScore(time, tap, userId, gameId);

//       if (data.resp) {
//         emit(SuccessGameScoreState());
//       } else {
//         emit(FailureGameScoreState(message: data.message));
//       }
//     } catch (e) {
//       emit(FailureGameScoreState(message: e.toString()));
//     }
//   }
// }

// import 'package:brainconcent_flutter/src/features/games/domain/entities/game_entity.dart';
// import 'package:brainconcent_flutter/src/features/games/presentation/widgets/card/game_card.dart';
// import 'package:brainconcent_flutter/src/features/games/presentation/views/game/controller/game_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class PopularGames extends StatelessWidget {
//   const PopularGames({
//     Key? key,
//     required this.width,
//     required this.height,
//   }) : super(key: key);

//   final double width;
//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     final gameController = Provider.of<GamesController>(context);

//     final games = gameController.games;

//     if (gameController.gameState == GameState.loading) {
//       return SizedBox(
//           height: height * 12,
//           child: const Center(child: CircularProgressIndicator()));
//     }
//     if (gameController.gameState == GameState.error) {
//       return Center(child: Text('An Error Occured ${gameController.message}'));
//     }

//     return Column(
//       children: [
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               ...List.generate(
//                 games.length,
//                 (index) => Padding(
//                   padding: EdgeInsets.only(left: width * 5),
//                   child: GameCard(
//                       cardSize: width * 55,
//                       games: games,
//                       index: index,
//                       height: height),
//                 ),
//               ),
//               SizedBox(width: width * 4),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

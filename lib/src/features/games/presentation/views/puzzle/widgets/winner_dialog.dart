// // ignore_for_file: avoid_print

// import 'package:brainconcent_flutter/src/core/widgets/show_loading.dart';
// import 'package:brainconcent_flutter/src/features/authentication/ui/global/controller/user_controller.dart';
// import 'package:brainconcent_flutter/src/features/game/data/services/game_details_service.dart';
// import 'package:brainconcent_flutter/src/features/game/ui/global/widgets/puzzle/up_to_down.dart';
// import 'package:brainconcent_flutter/src/features/game/ui/icons/puzzle_icons.dart';
// import 'package:brainconcent_flutter/src/core/utils/colors.dart';
// import 'package:brainconcent_flutter/src/core/utils/time_parser.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rive/rive.dart';

// Future<void> showWinnerDialog(
//   BuildContext context, {
//   required int moves,
//   required int time,
//   required String idGame,
// }) {
//   return showDialog(
//     context: context,
//     builder: (_) => WinnerDialog(
//       moves: moves,
//       time: time,
//       idGame: idGame,
//     ),
//   );
// }

// class WinnerDialog extends StatelessWidget {
//   final int moves;
//   final int time;
//   final String idGame;
//   const WinnerDialog({
//     Key? key,
//     required this.moves,
//     required this.time,
//     required this.idGame,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final userController = Provider.of<UsersController>(context);

//     final user = userController.user;

//     // final GameDetailsService gameDetailsService;

//     final gameDetailsService = Provider.of<GameDetailsService>(context);

//     return Center(
//       child: UpToDown(
//         child: Material(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           color: lightColor,
//           child: SizedBox(
//             width: 340,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AspectRatio(
//                   aspectRatio: 1.2,
//                   child: Stack(
//                     children: [
//                       const Center(
//                         child: RiveAnimation.asset(
//                           'assets/rive/winner.riv',
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 30),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: const [
//                               Text(
//                                 "!BUEN TRABAJO!",
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 "Has completado el rompecabezas",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 15,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     PuzzleIcons.watch,
//                                   ),
//                                   const SizedBox(width: 2),
//                                   Text(
//                                     parseTime(time),
//                                     style: const TextStyle(
//                                       fontSize: 17,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.multiple_stop_rounded,
//                                   ),
//                                   const SizedBox(width: 2),
//                                   Text(
//                                     "toques $moves",
//                                     style: const TextStyle(
//                                       fontSize: 17,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Container(
//                   height: 0.6,
//                   color: Colors.black12,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: TextButton(
//                     onPressed: gameDetailsService.authenticating
//                         ? null
//                         : () async {
//                             showLoading(context);

//                             final loginOk = await gameDetailsService
//                                 .getGameDetails(user.uid, idGame, time, moves);
//                             if (loginOk) {
//                               Navigator.of(context)
//                                 ..pop()
//                                 ..pop();
//                             } else {}
//                           },
//                     child: const Text(
//                       "ACEPTAR",
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

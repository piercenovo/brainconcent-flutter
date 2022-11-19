import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/controller/puzzle_controller.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/controller/puzzle_state.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/widgets/puzzle_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PuzzleInteractor extends StatelessWidget {
  const PuzzleInteractor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0),
      child: LayoutBuilder(builder: (context, constraints) {
        final controller = context.watch<PuzzleController>();
        final state = controller.state;
        final tileSize = constraints.maxWidth / state.crossAxisCount;

        final puzzle = state.puzzle;

        return AbsorbPointer(
          absorbing: state.status != PuzzleStatus.playing,
          child: Stack(
            children: state.puzzle.tiles
                .map(
                  (e) => PuzzleTile(
                    tile: e,
                    size: tileSize,
                    puzzleStatus: state.status,
                    showNumbersInTileImage: state.crossAxisCount > 4,
                    onTap: () => controller.onTileTapped(e),
                    imageTile: puzzle.segmentedImage != null
                        ? puzzle.segmentedImage![e.value - 1]
                        : null,
                  ),
                )
                .toList(),
          ),
        );
      }),
    );
  }
}

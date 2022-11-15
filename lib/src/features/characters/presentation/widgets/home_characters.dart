import 'package:brainconcent_flutter/src/features/characters/presentation/widgets/home_character_list.dart';
import 'package:brainconcent_flutter/src/features/characters/presentation/cubit/characters/characters_cubit.dart';
import 'package:brainconcent_flutter/src/features/characters/presentation/widgets/home_character_loading.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCharacters extends StatelessWidget {
  const HomeCharacters({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersInitial) {
          return HomeCharacterLoading(height: height, width: width);
        } else if (state is CharactersLoading) {
          return HomeCharacterLoading(height: height, width: width);
        } else if (state is CharactersSuccess) {
          final characters = state.characters;
          return HomeCharacterList(
            height: height,
            characters: characters,
            width: width,
          );
        } else if (state is CharactersFailure) {
          return ErrorMessage(
            message: state.message,
          );
        }
        return HomeCharacterLoading(height: height, width: width);
      },
    );
  }
}

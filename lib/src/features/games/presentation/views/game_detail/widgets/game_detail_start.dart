import 'package:brainconcent_flutter/src/core/helpers/animation_route.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/core/widgets/primary_button.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/login/login_screen.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameDetailStart extends StatelessWidget {
  const GameDetailStart({
    Key? key,
    required this.width,
    required this.game,
  }) : super(key: key);

  final double width;
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: BlocBuilder<UserCubit, UserState>(
          builder: (_, state) => (state.user == null)
              ? PrimaryButton(
                  height: getProportionateScreenHeight(58),
                  width: getProportionateScreenWidth(310),
                  text: 'Empezar',
                  bgColor: kSecondaryColorTwo,
                  textColor: kLightColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      routeGo(page: const LoginScreen()),
                    );
                  },
                  fontSize: width * 4.1,
                )
              : PrimaryButton(
                  height: getProportionateScreenHeight(58),
                  width: getProportionateScreenWidth(310),
                  text: 'Empezar',
                  bgColor: kSecondaryColorTwo,
                  textColor: kLightColor,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      game.link,
                      arguments: {
                        'uid': game.uid,
                      },
                    );
                  },
                  fontSize: width * 4.1,
                ),
        ));
  }
}

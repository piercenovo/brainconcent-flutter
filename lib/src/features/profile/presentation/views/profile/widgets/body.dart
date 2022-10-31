import 'package:brainconcent_flutter/src/core/helpers/animation_route.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/onboarding/onboarding_screen.dart';
import 'package:brainconcent_flutter/src/features/profile/presentation/views/profile/widgets/profile_info.dart';
import 'package:brainconcent_flutter/src/features/profile/presentation/views/profile/widgets/profile_logout.dart';
import 'package:brainconcent_flutter/src/features/profile/presentation/views/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserCubit>(context);
    final authBloc = BlocProvider.of<AuthCubit>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileInfo(),
          SizedBox(height: getProportionateScreenHeight(28)),
          Column(
            children: [
              ProfileMenu(
                text: "Mi cuenta",
                icon: "assets/icons/app/user.svg",
                press: () => {},
              ),
              ProfileMenu(
                text: "Configuración",
                icon: "assets/icons/app/settings-linear.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Términos y condiciones",
                icon: "assets/icons/app/terms.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Ayuda",
                icon: "assets/icons/app/help.svg",
                press: () {},
              ),
              ProfileLogout(
                text: "Cerrar cuenta",
                icon: "assets/icons/app/logout.svg",
                press: () {
                  authBloc.onLogOut();
                  userBloc.logOutAuth();
                  Navigator.pushAndRemoveUntil(context,
                      routeSlide(page: const OnBoardingScreen()), (_) => false);
                },
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(100)),
        ],
      ),
    );
  }
}

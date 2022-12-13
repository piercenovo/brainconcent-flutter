import 'package:brainconcent_flutter/src/core/helpers/animation_route.dart';
import 'package:brainconcent_flutter/src/core/helpers/modal_loading_short.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/onboarding/onboarding_screen.dart';
import 'package:brainconcent_flutter/src/features/profile/presentation/views/help/help.dart';
import 'package:brainconcent_flutter/src/features/profile/presentation/views/profile/widgets/profile_info.dart';
import 'package:brainconcent_flutter/src/features/profile/presentation/views/profile/widgets/profile_logout.dart';
import 'package:brainconcent_flutter/src/features/profile/presentation/views/profile/widgets/profile_menu.dart';
import 'package:brainconcent_flutter/src/features/profile/presentation/views/privacy_policy/privacy_policy_screen.dart';
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
                text: "Política de privacidad",
                icon: "assets/icons/app/terms.svg",
                press: () {
                  Navigator.push(
                      context, routeGo(page: const PrivacyPolicyScreen()));
                },
              ),
              ProfileMenu(
                text: "Ayuda",
                icon: "assets/icons/app/help.svg",
                press: () {
                  Navigator.push(context, routeGo(page: const HelpScreen()));
                },
              ),
              ProfileLogout(
                text: "Cerrar sesión",
                icon: "assets/icons/app/logout.svg",
                press: () {
                  authBloc.onLogOut();
                  userBloc.logOutAuth();
                  modalLoadingShort(context);

                  Navigator.pushAndRemoveUntil(context,
                      routeFade(page: const OnBoardingScreen()), (_) => false);
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

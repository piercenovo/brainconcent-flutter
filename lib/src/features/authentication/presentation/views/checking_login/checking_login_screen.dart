import 'package:brainconcent_flutter/src/core/helpers/animation_route.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/core/views/root/root_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckingLoginScreen extends StatefulWidget {
  const CheckingLoginScreen({Key? key}) : super(key: key);

  @override
  State<CheckingLoginScreen> createState() => _CheckingLoginScreenState();
}

class _CheckingLoginScreenState extends State<CheckingLoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserCubit>(context);

    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogOutState) {
          Navigator.pushAndRemoveUntil(context,
              routeSlide(page: const OnBoardingScreen()), (_) => false);
        } else if (state is AuthSuccess) {
          userBloc.getUserAuthentication();
          Navigator.pushAndRemoveUntil(
              context, routeSlide(page: const RootScreen()), (_) => false);
        }
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SizedBox(
              width: width * 50,
              height: width * 30,
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (_, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Image.asset('assets/images/app/brainy.png')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

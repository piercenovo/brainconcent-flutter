import 'package:brainconcent_flutter/src/core/helpers/animation_route.dart';
import 'package:brainconcent_flutter/src/core/helpers/error_message.dart';
import 'package:brainconcent_flutter/src/core/helpers/modal_loading_short.dart';
import 'package:brainconcent_flutter/src/core/views/root/root_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/login/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final _keyForm = GlobalKey<FormState>();

  final List<FocusNode> _loginFocusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    for (var element in _loginFocusNodes) {
      element.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    usernameController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = BlocProvider.of<AuthCubit>(context);
    final userBloc = BlocProvider.of<UserCubit>(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          modalLoadingShort(context);
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is AuthSuccess) {
          userBloc.getUserAuthentication();
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
              context, routeSlide(page: const RootScreen()), (_) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 45,
        ),
        body: Body(
          keyForm: _keyForm,
          usernameController: usernameController,
          passwordController: passwordController,
          size: size,
          authBloc: authBloc,
          loginFocusNodes: _loginFocusNodes,
        ),
      ),
    );
  }
}

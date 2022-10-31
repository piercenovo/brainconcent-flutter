import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/login/widgets/login_form.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/register/register_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/auth_image.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/auth_labels.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/auth_title_labels.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required GlobalKey<FormState> keyForm,
    required this.usernameController,
    required this.passwordController,
    required this.size,
    required this.authBloc,
    required List<FocusNode> loginFocusNodes,
  })  : _keyForm = keyForm,
        _loginFocusNodes = loginFocusNodes,
        super(key: key);

  final GlobalKey<FormState> _keyForm;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Size size;
  final AuthCubit authBloc;
  final List<FocusNode> _loginFocusNodes;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 3),
              const AuthImage(image: 'assets/images/authentication/login.png'),
              SizedBox(height: height * 2.5),
              const AuthTitleLabels(
                  title: 'Inicia Sesión',
                  subtitle: 'Bienvenido de nuevo,\n te hemos extrañado mucho.'),
              SizedBox(height: height * 2),
              LoginForm(
                keyForm: _keyForm,
                usernameController: usernameController,
                loginFocusNodes: _loginFocusNodes,
                passwordController: passwordController,
                height: height,
                authBloc: authBloc,
              ),
              const AuthLabels(
                  page: RegisterScreen(),
                  title: '¿Eres nuevo en Brainconcent?',
                  subtitle: 'Regístrate aquí'),
              SizedBox(height: height * 5),
            ],
          ),
        ),
      ),
    );
  }
}

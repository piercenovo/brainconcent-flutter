import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/login/login_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/register/widgets/register_form.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/auth_image.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/auth_labels.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/auth_title_labels.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required GlobalKey<FormState> keyForm,
    required this.nameController,
    required this.userController,
    required this.emailController,
    required this.passwordController,
    required this.size,
    required this.userBloc,
    required List<FocusNode> registerFocusNodes,
  })  : _keyForm = keyForm,
        _registerFocusNodes = registerFocusNodes,
        super(key: key);

  final GlobalKey<FormState> _keyForm;
  final TextEditingController nameController;
  final TextEditingController userController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Size size;
  final UserCubit userBloc;
  final List<FocusNode> _registerFocusNodes;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              SizedBox(height: height * 2),
              const AuthImage(
                  image: 'assets/images/authentication/register.png'),
              SizedBox(height: height * 2.5),
              const AuthTitleLabels(
                title: 'Regístrate',
                subtitle: '¿Eres nuevo en Brainconcent?',
              ),
              SizedBox(height: height * 2),
              RegisterForm(
                keyForm: _keyForm,
                nameController: nameController,
                usernameController: userController,
                emailController: emailController,
                passwordController: passwordController,
                registerFocusNodes: _registerFocusNodes,
                height: height,
                userBloc: userBloc,
              ),
              const AuthLabels(
                  page: LoginScreen(),
                  title: '¿Ya eres miembro de Brainconcent?',
                  subtitle: 'Inicia sesión'),
              SizedBox(height: height * 3),
            ],
          ),
        ),
      ),
    );
  }
}

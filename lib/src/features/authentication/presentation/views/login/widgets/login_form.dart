import 'package:brainconcent_flutter/src/core/helpers/validate_form.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'package:brainconcent_flutter/src/core/widgets/primary_button.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/text_custom_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> keyForm,
    required this.usernameController,
    required List<FocusNode> loginFocusNodes,
    required this.passwordController,
    required this.height,
    required this.authBloc,
  })  : _keyForm = keyForm,
        _loginFocusNodes = loginFocusNodes,
        super(key: key);

  final GlobalKey<FormState> _keyForm;
  final TextEditingController usernameController;
  final List<FocusNode> _loginFocusNodes;
  final TextEditingController passwordController;
  final double height;
  final AuthCubit authBloc;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;

    return Form(
      key: _keyForm,
      child: Column(children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        TextCustomField(
            controller: usernameController,
            hint: 'Usuario',
            icon: 'assets/icons/app/user.svg',
            fillColor: kLightColor,
            inputType: TextInputType.name,
            inputAction: TextInputAction.next,
            focusNode: _loginFocusNodes[0],
            validator: validatedUsername),
        SizedBox(height: getProportionateScreenHeight(15)),
        TextCustomField(
            controller: passwordController,
            hint: 'Contraseña',
            icon: 'assets/icons/app/lock.svg',
            fillColor: kLightColor,
            inputAction: TextInputAction.next,
            isPassword: true,
            focusNode: _loginFocusNodes[1],
            validator: validatedPassword),
        SizedBox(height: getProportionateScreenHeight(30)),
        PrimaryButton(
          height: getProportionateScreenHeight(58),
          width: getProportionateScreenWidth(310),
          text: 'Inicia sesión',
          textColor: kLightColor,
          bgColor: kSecondaryColor,
          onPressed: () {
            if (_keyForm.currentState!.validate()) {
              authBloc.login(usernameController.text.trim(),
                  passwordController.text.trim());
            }
          },
          fontSize: width * 4.5,
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ]),
    );
  }
}

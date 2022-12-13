import 'package:brainconcent_flutter/src/core/helpers/validate_form.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/core/widgets/primary_button.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/text_custom_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required GlobalKey<FormState> keyForm,
    required this.nameController,
    required List<FocusNode> registerFocusNodes,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.height,
    required this.userBloc,
  })  : _keyForm = keyForm,
        _registerFocusNodes = registerFocusNodes,
        super(key: key);

  final GlobalKey<FormState> _keyForm;
  final TextEditingController nameController;
  final List<FocusNode> _registerFocusNodes;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double height;
  final UserCubit userBloc;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;

    return Form(
      key: _keyForm,
      child: Column(children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        TextCustomField(
            controller: nameController,
            hint: 'Nombre Completo',
            icon: 'assets/icons/app/user.svg',
            fillColor: kLightColor,
            inputType: TextInputType.name,
            inputAction: TextInputAction.next,
            focusNode: _registerFocusNodes[0],
            validator: validatedName),
        SizedBox(height: getProportionateScreenHeight(15)),
        TextCustomField(
            controller: usernameController,
            hint: 'Usuario',
            icon: 'assets/icons/app/user.svg',
            fillColor: kLightColor,
            inputType: TextInputType.name,
            inputAction: TextInputAction.next,
            focusNode: _registerFocusNodes[1],
            validator: validatedUsername),
        SizedBox(height: getProportionateScreenHeight(15)),
        TextCustomField(
            controller: emailController,
            hint: 'Correo electrónico',
            icon: 'assets/icons/app/email.svg',
            fillColor: kLightColor,
            inputType: TextInputType.emailAddress,
            inputAction: TextInputAction.next,
            focusNode: _registerFocusNodes[2],
            validator: validatedEmail),
        SizedBox(height: getProportionateScreenHeight(15)),
        TextCustomField(
            controller: passwordController,
            hint: 'Contraseña',
            icon: 'assets/icons/app/lock.svg',
            fillColor: kLightColor,
            inputAction: TextInputAction.next,
            isPassword: true,
            focusNode: _registerFocusNodes[3],
            validator: validatedPassword),
        SizedBox(height: getProportionateScreenHeight(30)),
        PrimaryButton(
          height: getProportionateScreenHeight(58),
          width: getProportionateScreenWidth(310),
          text: 'Registrar cuenta',
          textColor: kLightColor,
          bgColor: kSecondaryColor,
          onPressed: () {
            if (_keyForm.currentState!.validate()) {
              userBloc.registerUser(
                nameController.text.trim(),
                usernameController.text.trim(),
                emailController.text.trim(),
                passwordController.text.trim(),
              );
            }
          },
          fontSize: width * 4.1,
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ]),
    );
  }
}

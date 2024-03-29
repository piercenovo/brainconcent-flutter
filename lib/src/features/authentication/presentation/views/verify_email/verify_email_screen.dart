import 'package:brainconcent_flutter/src/core/helpers/animation_route.dart';
import 'package:brainconcent_flutter/src/core/helpers/error_message.dart';
import 'package:brainconcent_flutter/src/core/helpers/modal_loading_short.dart';
import 'package:brainconcent_flutter/src/core/helpers/modal_success.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/login/login_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String email;

  const VerifyEmailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserCubit>(context);

    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoadingShort(context);
        } else if (state is SuccessUserState) {
          Navigator.pop(context);
          modalSuccess(context, 'Bienvenido a Brainconcent',
              onPressed: () => Navigator.pushAndRemoveUntil(context,
                  routeSlide(page: const LoginScreen()), (_) => false));
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/app/bx-chevron-left.svg',
                height: height * 3.8),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width * 8, vertical: height),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 100,
                    height: height * 28,
                    child: Lottie.asset(
                      'assets/json/verification-code.json',
                    ),
                  ),
                  SizedBox(height: height * 4),
                  TextCustom(
                      text: 'Verifica tu correo electrónico',
                      fontSize: width * 4.8,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: height * 2),
                  TextCustom(
                    text:
                        'Por favor ingresa el código de 5 dígitos enviado al correo electrónico: $email',
                    maxLines: 3,
                    fontSize: width * 3.8,
                    color: kTextColor.withOpacity(0.9),
                  ),
                  SizedBox(height: height * 4),
                  PinCodeTextField(
                      cursorColor: kBackgroundColor,
                      textStyle: const TextStyle(color: kTextColor),
                      appContext: context,
                      length: 5,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5653),
                        fieldHeight: 50,
                        inactiveColor: kSecondaryColorTwo,
                        activeColor: kSecondaryColor,
                        selectedColor: kPrimaryColor,
                      ),
                      onChanged: (value) {},
                      onCompleted: (value) =>
                          userBloc.verifyEmail(value, email))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

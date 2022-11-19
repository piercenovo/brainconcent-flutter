import 'package:brainconcent_flutter/src/core/helpers/animation_route.dart';
import 'package:brainconcent_flutter/src/core/helpers/error_message.dart';
import 'package:brainconcent_flutter/src/core/helpers/modal_loading_short.dart';
import 'package:brainconcent_flutter/src/core/helpers/modal_success.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/register/widgets/body.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/verify_email/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController userController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _keyForm = GlobalKey<FormState>();

  final List<FocusNode> _registerFocusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    userController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    for (var element in _registerFocusNodes) {
      element.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;

    final size = MediaQuery.of(context).size;
    final userBloc = BlocProvider.of<UserCubit>(context);

    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoadingShort(context);
        } else if (state is SuccessUserState) {
          Navigator.pop(context);
          modalSuccess(context, 'Usuario registrado',
              onPressed: () => Navigator.push(
                  context,
                  routeSlide(
                      page: VerifyEmailScreen(
                          email: emailController.text.trim()))));
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/app/bx-chevron-left.svg',
              height: height * 4,
              color: kSecondaryColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Body(
          registerFocusNodes: _registerFocusNodes,
          keyForm: _keyForm,
          nameController: nameController,
          userController: userController,
          emailController: emailController,
          passwordController: passwordController,
          size: size,
          userBloc: userBloc,
        ),
      ),
    );
  }
}

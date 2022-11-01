import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(80)),
        SizedBox(
          width: getProportionateScreenWidth(100),
          height: getProportionateScreenHeight(100),
          child: BlocBuilder<UserCubit, UserState>(
              builder: (_, state) => (state.user?.avatar != null)
                  ? CircleAvatar(
                      radius: getProportionateScreenWidth(50),
                      backgroundImage: AssetImage(
                        state.user!.avatar != ''
                            ? state.user!.avatar
                            : 'assets/images/avatar/juan-avatar.png',
                      ),
                    )
                  : const CircularProgressIndicator()),
        ),
        SizedBox(
          height: getProportionateScreenHeight(12),
        ),
        Center(
          child: BlocBuilder<UserCubit, UserState>(
              builder: (_, state) => (state.user?.username != null)
                  ? Text(
                      state.user!.username != ''
                          ? state.user!.username
                          : 'Usuario',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.bold,
                        color: kSecondaryColor,
                      ),
                    )
                  : const CircularProgressIndicator()),
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        Center(
          child: BlocBuilder<UserCubit, UserState>(
              builder: (_, state) => (state.user?.email != null)
                  ? Text(
                      state.user!.email != ''
                          ? state.user!.email
                          : 'correo electrónico',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w500,
                        color: kSecondaryColor,
                      ),
                    )
                  : const CircularProgressIndicator()),
        ),
        SizedBox(
          height: getProportionateScreenHeight(2),
        ),
      ],
    );
  }
}

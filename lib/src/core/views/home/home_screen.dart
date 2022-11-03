import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/core/views/home/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0.0,
        title: Text(
          'Brainconcent',
          style: GoogleFonts.raleway(
              color: kSecondaryColorTwo,
              fontSize: getProportionateScreenWidth(26),
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}

import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Correcciones de datos, informes de errores, soporte web/aplicaciones, sugerencias:',
                    style: TextStyle(
                        color: acentColor,
                        fontSize: width * 4,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height * 1.3),
                  Text(
                    'piercenovoah@gmail.com',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: kGrayColorTwo,
                      fontSize: width * 3.7,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 5),
            ],
          ),
        ),
      ),
    );
  }
}

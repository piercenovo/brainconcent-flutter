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
                    'POLÍTICA DE PRIVACIDAD',
                    style: TextStyle(
                        color: acentColor,
                        fontSize: width * 4.5,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height * 1.8),
                  Text(
                    'El presente Política de Privacidad establece los términos en que Native Technology Corp. usa y protege la información que es proporcionada por sus usuarios al momento de utilizar su aplicación móvil. Esta corporación está comprometida con la seguridad de los datos de sus usuarios. Cuando le pedimos llenar los campos de información personal con la cual usted pueda ser identificado, lo hacemos asegurando que sólo se empleará de acuerdo con los términos de este documento. Sin embargo, esta Política de Privacidad puede cambiar con el tiempo o ser actualizada por lo que le recomendamos y enfatizamos revisar continuamente esta página para asegurarse que está de acuerdo con dichos cambios.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: kGrayColorTwo,
                      fontSize: width * 3.7,
                    ),
                  ),
                  SizedBox(height: height * 1.8),
                  Text(
                    'Información que es recogida',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: acentColor,
                        fontSize: width * 4.5,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height * 1.8),
                  Text(
                    'Nuestra aplicación móvil podrá recoger información personal con el único fin de dar un seguimiento al progreso del usuario con los juegos de entrenamiento.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: kGrayColorTwo,
                      fontSize: width * 3.7,
                    ),
                  ),
                  SizedBox(height: height * 1.8),
                  Text(
                    'Uso de la información recogida',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: acentColor,
                        fontSize: width * 4.5,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height * 1.8),
                  Text(
                    'Nuestro videojuego emplea la información con el fin de proporcionar el mejor servicio posible, particularmente para mantener un registro de usuarios, de pedidos en caso que aplique, y mejorar nuestros productos y servicios. Es posible que sean enviados correos electrónicos periódicamente a través de nuestro sitio con ofertas especiales, nuevos productos y otra información publicitaria que consideremos relevante para usted o que pueda brindarle algún beneficio, estos correos electrónicos serán enviados a la dirección que usted proporcione y podrán ser cancelados en cualquier momento.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: kGrayColorTwo,
                      fontSize: width * 3.7,
                    ),
                  ),
                  SizedBox(height: height * 1.3),
                  Text(
                    'Native Technology Corp. está altamente comprometido para cumplir con el compromiso de mantener su información segura. Usamos los sistemas más avanzados y los actualizamos constantemente para asegurarnos que no exista ningún acceso no autorizado.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: kGrayColorTwo,
                      fontSize: width * 3.7,
                    ),
                  ),
                  SizedBox(height: height * 1.8),
                  Text(
                    'Control de su información personal',
                    style: TextStyle(
                        color: acentColor,
                        fontSize: width * 4.5,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height * 1.8),
                  Text(
                    'En cualquier momento usted puede restringir la recopilación o el uso de la información personal que es proporcionada a nuestra aplicación móvil. Cada vez que se le solicite rellenar un formulario, como el de alta de usuario, puede marcar o desmarcar la opción de recibir información por correo electrónico. En caso de que haya marcado la opción de recibir nuestro boletín o publicidad usted puede cancelarla en cualquier momento.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: kGrayColorTwo,
                      fontSize: width * 3.7,
                    ),
                  ),
                  SizedBox(height: height * 1.3),
                  Text(
                    'Esta corporación no venderá, cederá ni distribuirá la información personal que es recopilada sin su consentimiento, salvo que sea requerido por un juez con un orden judicial.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: kGrayColorTwo,
                      fontSize: width * 3.7,
                    ),
                  ),
                  SizedBox(height: height * 1.3),
                  Text(
                    'Native Technology Corp. Se reserva el derecho de cambiar los términos de la presente Política de Privacidad en cualquier momento.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: kGrayColorTwo,
                      fontSize: width * 3.7,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 3),
            ],
          ),
        ),
      ),
    );
  }
}

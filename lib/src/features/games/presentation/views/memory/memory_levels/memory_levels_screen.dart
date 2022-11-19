import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/memory/memory_levels/widgets/memory_details.dart';
import 'package:flutter/material.dart';

class MemoryLevelsScreen extends StatefulWidget {
  const MemoryLevelsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MemoryLevelsScreenState createState() => _MemoryLevelsScreenState();
}

class _MemoryLevelsScreenState extends State<MemoryLevelsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _scaleAnimation =
        Tween<double>(begin: 0.7, end: 0.6).animate(_animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final gameId = arguments['uid'];

    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return Scaffold(
        backgroundColor: lightColor2,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 10, vertical: height * 16),
          child: Column(children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (_, child) => Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Image.asset('assets/images/app/brainy.png')),
            ),
            SizedBox(
              height: height * 4,
            ),
            ...List.generate(
              memoryList.length,
              (index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    memoryList[index].goto,
                    arguments: {
                      'uid': gameId,
                    },
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: height * 2),
                        width: double.infinity,
                        height: height * 9,
                        decoration: BoxDecoration(
                          color: memoryList[index].primarycolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              memoryList[index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 5.5,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            SizedBox(
                              width: width * 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: genrateStar(memoryList[index].noOfstar),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ]),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_ui/shared/component.dart';
import 'package:rive/rive.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  Artboard? riveArtBoard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHappy;
  late RiveAnimationController controllerAngry;

  bool isHappy = false;
  bool isAngry = false;

  void removeAllControllers() {
    riveArtBoard?.artboard.removeController(controllerIdle);
    riveArtBoard?.artboard.removeController(controllerAngry);
    riveArtBoard?.artboard.removeController(controllerAngry);
    bool isHappy = false;
    bool isAngry = false;
  }

  void addIdleController() {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerIdle);
  }

  void addHappyController() {
    removeAllControllers();
    isHappy = true;
    riveArtBoard?.artboard.addController(controllerHappy);
  }

  void addAngryController() {
    removeAllControllers();
    isAngry = true;
    riveArtBoard?.artboard.addController(controllerAngry);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.Idle.name);
    controllerHappy = SimpleAnimation(AnimationEnum.Happy.name);
    controllerAngry = SimpleAnimation(AnimationEnum.Angry.name);

    rootBundle.load('assets/grumpy-bear-2.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtBoard = artboard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: riveArtBoard == null
                ? const SizedBox.shrink()
                : Rive(
                    artboard: riveArtBoard!,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    addAngryController();
                  },
                  icon: Icon(Icons.dangerous_rounded)),
              IconButton(
                  onPressed: () {
                    addHappyController();
                  },
                  icon: Icon(Icons.emoji_emotions)),
            ],
          ),
        ],
      ),
    );
  }
}

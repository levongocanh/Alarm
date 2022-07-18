import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class ShakePhoneMission extends StatefulWidget {
  Alarm alarm;
  bool isPreview;

  ShakePhoneMission({Key? key, required this.alarm, this.isPreview = true})
      : super(key: key);

  @override
  State<ShakePhoneMission> createState() => __ShakePhoneState();
}

class __ShakePhoneState extends State<ShakePhoneMission> {
  late int shakesLeft;
  late ShakeDetector detector;

  @override
  void initState() {
    shakesLeft = widget.alarm.numberOfProblems!;
    detector = ShakeDetector.autoStart(
      shakeThresholdGravity: 1.25 + widget.alarm.missionDifficulty! * 0.5,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      minimumShakeCount: 1,
      onPhoneShake: () {
        setState(() {
          shakesLeft--;
        });
        if (shakesLeft == 0) {
          Navigator.of(context)
            ..pop()
            ..pop();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // disable back button
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Lắc điện thoại',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              shakesLeft == widget.alarm.numberOfProblems!
                  ? const Icon(
                      Icons.vibration,
                      size: 200,
                      color: Colors.white,
                    )
                  : Text(
                      '$shakesLeft',
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
            ],
          ),
        ),
        bottomNavigationBar: widget.isPreview == true
            ? BottomButton(
                text: 'Exit Preview',
                margin: const EdgeInsetsDirectional.all(0),
                borderRadius: 0,
                color: Colors.white,
                textColor: Colors.black,
                onTap: () {
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                  debugPrint('Exit Preview');
                },
              )
            : null,
      ),
    );
  }
}

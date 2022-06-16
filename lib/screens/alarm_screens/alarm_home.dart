import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AlarmFloatingActionButton extends StatefulWidget {
  const AlarmFloatingActionButton({Key? key}) : super(key: key);
  
  @override
  State<AlarmFloatingActionButton> createState() => _AlarmFloatingActionButtonState();
}

class _AlarmFloatingActionButtonState extends State<AlarmFloatingActionButton> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WillPopScope(
        onWillPop: () async{
            if(isDialOpen.value){
              isDialOpen.value = false;
              return false;
            }else{
              return true;
            }
        },
        child: Scaffold(
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            openCloseDial: isDialOpen,
            backgroundColor: Colors.blue,
            overlayOpacity: 0,
            spacing: 10,
            spaceBetweenChildren: 10,
            closeManually: true,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.alarm),
                label: 'Báo thức',
                backgroundColor: Colors.blue,
                onTap: (){
                  debugPrint('Đã mở tạo báo thức');
                }
              ),
              SpeedDialChild(
                child: const Icon(Icons.bolt),
                label: 'Báo thức nhanh',
                backgroundColor: Colors.blue,
                  onTap: (){
                    debugPrint('Đã mở tạo báo thức nhanh');
                  }
              ),
            ],
          ),
          body: Container(
            alignment: Alignment.center,
            child: const Text("FAB Menu",style: TextStyle(fontSize: 30),),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


void setupWorldTime() async  {
  WorldTime instance = WorldTime(location: 'kolkata', flag: 'india.png', url:'Asia/Kolkata',  );
 await  instance.getTime();
 print(instance.time);
 Navigator.pushReplacementNamed(context,'/home',arguments: {
   'location':instance.location,
   'flag':instance.flag,
   'time':instance.time,
   'isDaytime':instance.isDaytime,
 });

}


  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 150,
        ),
      )

    );
  }
}

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  List<WorldTime> location = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa1.png'),
  ];


void updateTime(index)async{
  WorldTime instance =  location[index];
  await instance.getTime();
  
  Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDaytime':instance.isDaytime,
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("choose  a Location"),
          centerTitle: true,
          elevation: 0,
        ),
        body:ListView.builder(
          itemCount: location.length ,
            itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Card(
                child: ListTile(
                  onTap: (){
                    print(location[index].location);
                    updateTime(index);
                  },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${location[index].flag}'),
                  ),
                ),
              ),
            );

        }) );
  }
}

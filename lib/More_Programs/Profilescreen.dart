import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constant.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ProfileImage(),
          ProfileActions()
        ],
      )
    ,
    ); 
  }
}
class ProfileImage extends StatelessWidget {
  const ProfileImage ({super.key});

@override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           ClipOval( 
          child: Center(
            child: Image.network(
              profileimg,
              height: 200,
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Center(
                child: Text("Name: Jhon",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),),
              ),
              const Text("Designation: Developer", style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 175, 111, 76),
              ),
              ),
              Text("Age: 25", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
        
      ],
    );  
  }
}


class ProfileActions extends StatelessWidget{
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(Icons.restaurant_outlined,"40", Colors.black),
        _buildIcon(Icons.favorite,"40",Colors.black),
        _buildIcon(Icons.directions,"40",Colors.black),



      ],
    );
  }
  Widget _buildIcon(IconData icon, String icontext, Color c1){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        Icon(icon,
        size: 40 ,
        color: c1,),
        Text(icontext)
      ],
      ),
       );
  }
}
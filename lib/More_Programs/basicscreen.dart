import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utils/constant.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: AspectRatio(
        aspectRatio: 1/2,
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Container(
            color: const Color.fromARGB(255, 113, 10, 2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(self, width: 600,), 
                        Image.network(urlimage, height: 280, width: 600,),
                      ],
                    ),
                    
                           
                    ),
                ),
                ),
            ),
          )
          ),
      ),
    );
  }
}
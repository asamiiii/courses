

import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  
  String? content ;
  String? imagePath;

  CourseDetailsScreen({Key? key,this.imagePath,this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: const Color.fromARGB(
          255,
          0,
          31,
          132,
        ),
        title: const Text('Route App one'),
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/Bg.jpg',fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
          Positioned(
            top: 10,
            left: 20,
            right: 20,
            bottom: 420,
            child: Image.asset(imagePath!),
          ),
          Positioned(
            top: 230,
            left: 20,
            right: 20,
            bottom: 10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('$content',style: const TextStyle(color: Colors.white,fontSize: 20),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

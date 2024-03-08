import 'dart:ffi';

import 'package:example/thirdscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Color _bgcolor=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgcolor,
      appBar: AppBar(title: Text("Second Screen"),actions: [
        IconButton(onPressed: (){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> ThirdScreen()));
        },
            icon: Icon(CupertinoIcons.arrow_right_circle_fill,color: Colors.red,))
      ],),
      body: InkWell(
          onTap: (){
            if (_bgcolor==Colors.red) {
              _bgcolor=Colors.white;
            } else {
              _bgcolor=Colors.red;
          }
            setState(() {
            });
          },
          child: Center(
            child: Image.network("https://subzfresh.com/wp-content/uploads/2022/04/apple_158989157.jpg",
            width: 200,height: 200,),
          )),
    );
  }
}

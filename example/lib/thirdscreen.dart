import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final _text1=TextEditingController();
  final _text2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter Details"),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _text1,
              decoration: InputDecoration(label: Text("Name"),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _text2,
                decoration: InputDecoration(label: Text("Password"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            ElevatedButton.icon(
                onPressed: (){
                    if(_text1.text!="" && _text2.text!="") {
                      try {
                        var _w=int.parse(_text1.text)+int.parse(_text2.text);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_w.toString()),));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("d"),));
                      }

                    }
                }, icon: Icon(Icons.edit,size: 30,),
            label:Text("Enter",style: TextStyle(fontSize: 20),))
          ],
        ),
      ),
    );
  }
}

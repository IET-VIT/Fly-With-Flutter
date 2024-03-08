import 'package:example/secondscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyApp"),backgroundColor: Colors.orange,),
      body: Center(
          child: Text("Hii",style: TextStyle(fontSize: 40,color: Colors.red,fontWeight: FontWeight.w500),)),
      bottomSheet: Text("❤"),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (_)=> SecondScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
